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

class ServoOnOff {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
      this.servo_on_states = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('servo_on_states')) {
        this.servo_on_states = initObj.servo_on_states
      }
      else {
        this.servo_on_states = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServoOnOff
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [servo_on_states]
    bufferOffset = _arraySerializer.bool(obj.servo_on_states, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoOnOff
    let len;
    let data = new ServoOnOff(null);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [servo_on_states]
    data.servo_on_states = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += object.servo_on_states.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kxr_controller/ServoOnOff';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '29bb8c289c7a237569042d21176cbdd5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] joint_names
    bool[] servo_on_states
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServoOnOff(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.servo_on_states !== undefined) {
      resolved.servo_on_states = msg.servo_on_states;
    }
    else {
      resolved.servo_on_states = []
    }

    return resolved;
    }
};

module.exports = ServoOnOff;
