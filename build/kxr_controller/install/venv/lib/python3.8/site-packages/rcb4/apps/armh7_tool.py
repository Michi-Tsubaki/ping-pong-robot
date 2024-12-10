#!/usr/bin/env python

import argparse

import pandas as pd
from tabulate import tabulate
import yaml

from rcb4.armh7interface import ARMH7Interface


def calibrate_worms(interface, file_path, output_path, update=False, inplace=False):
    with open(file_path) as file:
        data = yaml.safe_load(file)

    output_str = ""
    for entry in data:
        print(entry)
        worm_id = entry["worm_id"]
        servo_id = entry["servo_id"]
        sensor_id = entry["sensor_id"]
        magenc_present = entry.get("magenc_init", None)
        if update is True:
            magenc_present = None
        calibrated_value = interface.calibrate_worm(
            worm_id, servo_id, sensor_id, magenc_present
        )
        entry["magenc_init"] = calibrated_value
        output_str += f" - {{worm_id: {worm_id}, servo_id: {servo_id}, sensor_id: {sensor_id}, magenc_init: {calibrated_value}}}\n"
    interface.databssram_to_dataflash()
    if inplace:
        output_path = file_path
    print(output_str, end="")
    if output_path:
        with open(output_path, "w") as file:
            file.write(output_str)
        print(f"Worm calibration file is saved to {output_path}")


def read_calib_sensors(interface, output_path):
    output_str = ""
    for worm_id in interface.search_worm_ids():
        worm = interface.read_worm_calib_data(worm_id)
        output_str += f" - {{worm_id: {worm_id}, servo_id: {worm.servo_id}, sensor_id: {worm.sensor_id}, magenc_init: {worm.magenc_init}}}\n"
    print(output_str, end="")
    with open(output_path, "w") as file:
        file.write(output_str)
    print(f"Worm calibration file is saved to {output_path}")


def print_sensor_values(interface):
    try:
        while True:
            sensors = interface.all_jointbase_sensors()
            data = {
                "ID": [sensor.id for sensor in sensors],
                "Magenc": [sensor.magenc for sensor in sensors],
                "Proximity1": [sensor.ps[0] for sensor in sensors],
                "Proximity2": [sensor.ps[1] for sensor in sensors],
                "Proximity3": [sensor.ps[2] for sensor in sensors],
                "Proximity4": [sensor.ps[3] for sensor in sensors],
                "Force1": [sensor.adc[0] for sensor in sensors],
                "Force2": [sensor.adc[1] for sensor in sensors],
                "Force3": [sensor.adc[2] for sensor in sensors],
                "Force4": [sensor.adc[3] for sensor in sensors],
            }
            df = pd.DataFrame(data)

            print(tabulate(df, headers="keys", tablefmt="psql", showindex=False))
            print("\033[H\033[J", end="")
    except KeyboardInterrupt:
        pass


def print_worm_values(interface):
    attributes = [
        "servo_id",
        "sensor_id",
        "magenc_init",
        "magenc_present",
        "present_angle",
    ]
    try:
        while True:
            sensors = [
                interface.read_worm_calib_data(worm_idx)
                for worm_idx in interface.search_worm_ids()
            ]
            data = {attr: [] for attr in attributes}
            for sensor in sensors:
                for attr in attributes:
                    data[attr].append(getattr(sensor, attr, "N/A"))
            df = pd.DataFrame(data)
            print(tabulate(df, headers="keys", tablefmt="psql", showindex=False))
            print("\033[H\033[J", end="")
    except KeyboardInterrupt:
        pass


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    parser_calibrate = subparsers.add_parser(
        "calibrate", help="Calibrate worm gear module."
    )
    parser_calibrate.add_argument(
        "--device", "-d", default=None, help="Input device port."
    )
    parser_calibrate.add_argument("file_path", type=str, help="Path to yaml file.")
    parser_calibrate.add_argument(
        "--inplace", "-i", action="store_true", help="Overwrite file_path."
    )
    parser_calibrate.add_argument(
        "--update",
        "-u",
        action="store_true",
        help="Overwrite input yaml's current magenc_init.",
    )
    parser_calibrate.add_argument(
        "--output", "-o", type=str, help="Output file path for calibrated data."
    )

    parser_calibrate.set_defaults(
        func=lambda args: calibrate_worms(
            ARMH7Interface.from_port(args.device),
            args.file_path,
            output_path=args.output,
            update=args.update,
            inplace=args.inplace,
        )
    )

    parser_read_calib = subparsers.add_parser(
        "read-calib", help="Read worm gear module calib data from armh7"
    )
    parser_read_calib.add_argument(
        "--device", "-d", default=None, help="Input device port."
    )
    parser_read_calib.add_argument(
        "output_file_path", type=str, help="Output path to yaml file."
    )
    parser_read_calib.set_defaults(
        func=lambda args: read_calib_sensors(
            ARMH7Interface.from_port(args.device), args.output_file_path
        )
    )

    parser_print_sensor = subparsers.add_parser(
        "print-sensor", help="Print sensor values."
    )
    parser_print_sensor.add_argument(
        "--device", "-d", default=None, help="Input device port."
    )
    parser_print_sensor.set_defaults(
        func=lambda args: print_sensor_values(ARMH7Interface.from_port(args.device))
    )

    parser_print_worm = subparsers.add_parser("print-worm", help="Print worm values.")
    parser_print_worm.add_argument(
        "--device", "-d", default=None, help="Input device port."
    )
    parser_print_worm.set_defaults(
        func=lambda args: print_worm_values(ARMH7Interface.from_port(args.device))
    )

    args = parser.parse_args()
    if hasattr(args, "func"):
        args.func(args)
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
