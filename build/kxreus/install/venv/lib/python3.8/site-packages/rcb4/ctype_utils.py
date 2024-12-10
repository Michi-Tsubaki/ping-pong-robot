import numpy as np

type_mapping = {
    "int8": np.int8,
    "int16": np.int16,
    "int32": np.int32,
    "uint8": np.uint8,
    "uint16": np.uint16,
    "uint32": np.uint32,
    "float": np.float32,
    "double": np.float64,
}


def c_type_to_size(c_type):
    return {
        "uint8": 1,
        "uint16": 2,
        "float": 4,
        "double": 8,
        "int": 4,
        "int16": 2,
        "uint32": 4,
    }[c_type]


def c_type_to_numpy_format(c_type):
    return type_mapping.get(c_type, lambda: ValueError(f"c_type {c_type}"))()
