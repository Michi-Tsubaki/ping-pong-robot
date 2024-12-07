// Auto-generated. Do not edit!

// (in-package kxr_controller.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PressureControl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.board_idx = null;
      this.start_pressure = null;
      this.stop_pressure = null;
      this.release = null;
    }
    else {
      if (initObj.hasOwnProperty('board_idx')) {
        this.board_idx = initObj.board_idx
      }
      else {
        this.board_idx = 0;
      }
      if (initObj.hasOwnProperty('start_pressure')) {
        this.start_pressure = initObj.start_pressure
      }
      else {
        this.start_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('stop_pressure')) {
        this.stop_pressure = initObj.stop_pressure
      }
      else {
        this.stop_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('release')) {
        this.release = initObj.release
      }
      else {
        this.release = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PressureControl
    // Serialize message field [board_idx]
    bufferOffset = _serializer.uint16(obj.board_idx, buffer, bufferOffset);
    // Serialize message field [start_pressure]
    bufferOffset = _serializer.float32(obj.start_pressure, buffer, bufferOffset);
    // Serialize message field [stop_pressure]
    bufferOffset = _serializer.float32(obj.stop_pressure, buffer, bufferOffset);
    // Serialize message field [release]
    bufferOffset = _serializer.bool(obj.release, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PressureControl
    let len;
    let data = new PressureControl(null);
    // Deserialize message field [board_idx]
    data.board_idx = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [start_pressure]
    data.start_pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [stop_pressure]
    data.stop_pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [release]
    data.release = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kxr_controller/PressureControl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '61bcf3809e7f0e409628cc484675109d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 board_idx  # Do not use board id? (Currently, bus-connected air board is not supported)
    float32 start_pressure  # Threshold [kPa] to start pump (Currently, pressurization is not supported)
    float32 stop_pressure  # Threshold [kPa] to stop pump (Currently, pressurization is not supported)
    bool release  # Set true to release air by opening valve.
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PressureControl(null);
    if (msg.board_idx !== undefined) {
      resolved.board_idx = msg.board_idx;
    }
    else {
      resolved.board_idx = 0
    }

    if (msg.start_pressure !== undefined) {
      resolved.start_pressure = msg.start_pressure;
    }
    else {
      resolved.start_pressure = 0.0
    }

    if (msg.stop_pressure !== undefined) {
      resolved.stop_pressure = msg.stop_pressure;
    }
    else {
      resolved.stop_pressure = 0.0
    }

    if (msg.release !== undefined) {
      resolved.release = msg.release;
    }
    else {
      resolved.release = false
    }

    return resolved;
    }
};

module.exports = PressureControl;
