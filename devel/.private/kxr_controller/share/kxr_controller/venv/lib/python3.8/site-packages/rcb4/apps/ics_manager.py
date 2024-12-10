#!/usr/bin/env python

import argparse
import sys

import yaml

from rcb4.ics import ICSServoController


def load_yaml(yaml_path):
    try:
        with open(yaml_path) as file:
            data = yaml.safe_load(file)
            print("YAML configuration loaded successfully.")
            return data
    except FileNotFoundError:
        print(f"Error: YAML file not found at path: {yaml_path}")
        sys.exit(1)
    except yaml.YAMLError as exc:
        print(f"Error parsing YAML file: {exc}")
        sys.exit(1)


def parse_args():
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(description="ICS Servo Controller CLI Tool")
    parser.add_argument(
        "--yaml-path",
        default=None,
        help="Path to YAML configuration file for servo settings"
    )
    parser.add_argument(
        "--baudrate",
        type=int,
        default=1250000,
        choices=[1250000, 625000, 115200],
        help="Baud rate for servo connection"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Enable verbose output"
    )
    return parser.parse_args()


def main():
    args = parse_args()

    # Verbose output if enabled
    if args.verbose:
        print(f"Using baud rate: {args.baudrate}")
        if args.yaml_path:
            print(f"Loading configuration from: {args.yaml_path}")
        else:
            print("No YAML configuration file specified.")

    if args.yaml_path:
        load_yaml(args.yaml_path)

    # Initialize the ICS Servo Controller
    servo_controller = ICSServoController(
        baudrate=args.baudrate,
        yaml_path=args.yaml_path
    )

    try:
        servo_controller.display_status()
    except Exception as e:
        print(f"An error occurred while displaying status: {e}")
    finally:
        servo_controller.close_connection()
        print("Connection closed.")


if __name__ == "__main__":
    main()
