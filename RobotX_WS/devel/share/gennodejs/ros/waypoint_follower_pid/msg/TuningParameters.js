// Auto-generated. Do not edit!

// (in-package waypoint_follower_pid.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TuningParameters {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.out_x = null;
      this.out_v = null;
      this.err_v = null;
    }
    else {
      if (initObj.hasOwnProperty('out_x')) {
        this.out_x = initObj.out_x
      }
      else {
        this.out_x = 0.0;
      }
      if (initObj.hasOwnProperty('out_v')) {
        this.out_v = initObj.out_v
      }
      else {
        this.out_v = 0.0;
      }
      if (initObj.hasOwnProperty('err_v')) {
        this.err_v = initObj.err_v
      }
      else {
        this.err_v = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TuningParameters
    // Serialize message field [out_x]
    bufferOffset = _serializer.float32(obj.out_x, buffer, bufferOffset);
    // Serialize message field [out_v]
    bufferOffset = _serializer.float32(obj.out_v, buffer, bufferOffset);
    // Serialize message field [err_v]
    bufferOffset = _serializer.float32(obj.err_v, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TuningParameters
    let len;
    let data = new TuningParameters(null);
    // Deserialize message field [out_x]
    data.out_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [out_v]
    data.out_v = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [err_v]
    data.err_v = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'waypoint_follower_pid/TuningParameters';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0980976f0bdca75f72b664cc976a51bc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Tuning message
    float32 out_x
    float32 out_v
    float32 err_v
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TuningParameters(null);
    if (msg.out_x !== undefined) {
      resolved.out_x = msg.out_x;
    }
    else {
      resolved.out_x = 0.0
    }

    if (msg.out_v !== undefined) {
      resolved.out_v = msg.out_v;
    }
    else {
      resolved.out_v = 0.0
    }

    if (msg.err_v !== undefined) {
      resolved.err_v = msg.err_v;
    }
    else {
      resolved.err_v = 0.0
    }

    return resolved;
    }
};

module.exports = TuningParameters;
