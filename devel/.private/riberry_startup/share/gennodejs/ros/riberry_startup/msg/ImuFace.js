// Auto-generated. Do not edit!

// (in-package riberry_startup.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ImuFace {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.face = null;
    }
    else {
      if (initObj.hasOwnProperty('face')) {
        this.face = initObj.face
      }
      else {
        this.face = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImuFace
    // Serialize message field [face]
    bufferOffset = _serializer.uint8(obj.face, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImuFace
    let len;
    let data = new ImuFace(null);
    // Deserialize message field [face]
    data.face = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'riberry_startup/ImuFace';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc43845fd7aaeadf93808c9e9901eb62';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 NONE=0
    uint8 TOP=1
    uint8 BOTTOM=2
    uint8 FRONT=3
    uint8 BACK=4
    uint8 LEFT=5
    uint8 RIGHT=6
    
    uint8 face
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImuFace(null);
    if (msg.face !== undefined) {
      resolved.face = msg.face;
    }
    else {
      resolved.face = 0
    }

    return resolved;
    }
};

// Constants for message
ImuFace.Constants = {
  NONE: 0,
  TOP: 1,
  BOTTOM: 2,
  FRONT: 3,
  BACK: 4,
  LEFT: 5,
  RIGHT: 6,
}

module.exports = ImuFace;
