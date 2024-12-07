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

class Stretch {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
      this.stretch = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('stretch')) {
        this.stretch = initObj.stretch
      }
      else {
        this.stretch = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Stretch
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [stretch]
    bufferOffset = _arraySerializer.int32(obj.stretch, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Stretch
    let len;
    let data = new Stretch(null);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [stretch]
    data.stretch = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 4 * object.stretch.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kxr_controller/Stretch';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b2b730aeb11dca161b5a118a2171acb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] joint_names
    int32[] stretch
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Stretch(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.stretch !== undefined) {
      resolved.stretch = msg.stretch;
    }
    else {
      resolved.stretch = []
    }

    return resolved;
    }
};

module.exports = Stretch;
