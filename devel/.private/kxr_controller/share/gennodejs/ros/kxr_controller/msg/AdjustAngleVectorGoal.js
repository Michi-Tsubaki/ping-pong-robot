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

class AdjustAngleVectorGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
      this.error_threshold = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('error_threshold')) {
        this.error_threshold = initObj.error_threshold
      }
      else {
        this.error_threshold = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AdjustAngleVectorGoal
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [error_threshold]
    bufferOffset = _arraySerializer.float32(obj.error_threshold, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AdjustAngleVectorGoal
    let len;
    let data = new AdjustAngleVectorGoal(null);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [error_threshold]
    data.error_threshold = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 4 * object.error_threshold.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kxr_controller/AdjustAngleVectorGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cf618411b2b5e77c4c269ff22a27ed58';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    string[] joint_names
    float32[] error_threshold
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AdjustAngleVectorGoal(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.error_threshold !== undefined) {
      resolved.error_threshold = msg.error_threshold;
    }
    else {
      resolved.error_threshold = []
    }

    return resolved;
    }
};

module.exports = AdjustAngleVectorGoal;