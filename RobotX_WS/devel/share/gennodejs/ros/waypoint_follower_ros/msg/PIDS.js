// Auto-generated. Do not edit!

// (in-package waypoint_follower_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PIDS {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lin_pos_P = null;
      this.lin_pos_I = null;
      this.lin_pos_D = null;
      this.lin_vel_P = null;
      this.lin_vel_I = null;
      this.lin_vel_D = null;
      this.angular_P = null;
      this.angular_I = null;
      this.angular_D = null;
    }
    else {
      if (initObj.hasOwnProperty('lin_pos_P')) {
        this.lin_pos_P = initObj.lin_pos_P
      }
      else {
        this.lin_pos_P = 0.0;
      }
      if (initObj.hasOwnProperty('lin_pos_I')) {
        this.lin_pos_I = initObj.lin_pos_I
      }
      else {
        this.lin_pos_I = 0.0;
      }
      if (initObj.hasOwnProperty('lin_pos_D')) {
        this.lin_pos_D = initObj.lin_pos_D
      }
      else {
        this.lin_pos_D = 0.0;
      }
      if (initObj.hasOwnProperty('lin_vel_P')) {
        this.lin_vel_P = initObj.lin_vel_P
      }
      else {
        this.lin_vel_P = 0.0;
      }
      if (initObj.hasOwnProperty('lin_vel_I')) {
        this.lin_vel_I = initObj.lin_vel_I
      }
      else {
        this.lin_vel_I = 0.0;
      }
      if (initObj.hasOwnProperty('lin_vel_D')) {
        this.lin_vel_D = initObj.lin_vel_D
      }
      else {
        this.lin_vel_D = 0.0;
      }
      if (initObj.hasOwnProperty('angular_P')) {
        this.angular_P = initObj.angular_P
      }
      else {
        this.angular_P = 0.0;
      }
      if (initObj.hasOwnProperty('angular_I')) {
        this.angular_I = initObj.angular_I
      }
      else {
        this.angular_I = 0.0;
      }
      if (initObj.hasOwnProperty('angular_D')) {
        this.angular_D = initObj.angular_D
      }
      else {
        this.angular_D = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PIDS
    // Serialize message field [lin_pos_P]
    bufferOffset = _serializer.float64(obj.lin_pos_P, buffer, bufferOffset);
    // Serialize message field [lin_pos_I]
    bufferOffset = _serializer.float64(obj.lin_pos_I, buffer, bufferOffset);
    // Serialize message field [lin_pos_D]
    bufferOffset = _serializer.float64(obj.lin_pos_D, buffer, bufferOffset);
    // Serialize message field [lin_vel_P]
    bufferOffset = _serializer.float64(obj.lin_vel_P, buffer, bufferOffset);
    // Serialize message field [lin_vel_I]
    bufferOffset = _serializer.float64(obj.lin_vel_I, buffer, bufferOffset);
    // Serialize message field [lin_vel_D]
    bufferOffset = _serializer.float64(obj.lin_vel_D, buffer, bufferOffset);
    // Serialize message field [angular_P]
    bufferOffset = _serializer.float64(obj.angular_P, buffer, bufferOffset);
    // Serialize message field [angular_I]
    bufferOffset = _serializer.float64(obj.angular_I, buffer, bufferOffset);
    // Serialize message field [angular_D]
    bufferOffset = _serializer.float64(obj.angular_D, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PIDS
    let len;
    let data = new PIDS(null);
    // Deserialize message field [lin_pos_P]
    data.lin_pos_P = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lin_pos_I]
    data.lin_pos_I = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lin_pos_D]
    data.lin_pos_D = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lin_vel_P]
    data.lin_vel_P = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lin_vel_I]
    data.lin_vel_I = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lin_vel_D]
    data.lin_vel_D = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angular_P]
    data.angular_P = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angular_I]
    data.angular_I = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angular_D]
    data.angular_D = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'waypoint_follower_ros/PIDS';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a4a02a0cfead8995261060fd7d683381';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # PIDS message
    float64 lin_pos_P
    float64 lin_pos_I
    float64 lin_pos_D
    
    float64 lin_vel_P
    float64 lin_vel_I
    float64 lin_vel_D
    
    float64 angular_P
    float64 angular_I
    float64 angular_D
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PIDS(null);
    if (msg.lin_pos_P !== undefined) {
      resolved.lin_pos_P = msg.lin_pos_P;
    }
    else {
      resolved.lin_pos_P = 0.0
    }

    if (msg.lin_pos_I !== undefined) {
      resolved.lin_pos_I = msg.lin_pos_I;
    }
    else {
      resolved.lin_pos_I = 0.0
    }

    if (msg.lin_pos_D !== undefined) {
      resolved.lin_pos_D = msg.lin_pos_D;
    }
    else {
      resolved.lin_pos_D = 0.0
    }

    if (msg.lin_vel_P !== undefined) {
      resolved.lin_vel_P = msg.lin_vel_P;
    }
    else {
      resolved.lin_vel_P = 0.0
    }

    if (msg.lin_vel_I !== undefined) {
      resolved.lin_vel_I = msg.lin_vel_I;
    }
    else {
      resolved.lin_vel_I = 0.0
    }

    if (msg.lin_vel_D !== undefined) {
      resolved.lin_vel_D = msg.lin_vel_D;
    }
    else {
      resolved.lin_vel_D = 0.0
    }

    if (msg.angular_P !== undefined) {
      resolved.angular_P = msg.angular_P;
    }
    else {
      resolved.angular_P = 0.0
    }

    if (msg.angular_I !== undefined) {
      resolved.angular_I = msg.angular_I;
    }
    else {
      resolved.angular_I = 0.0
    }

    if (msg.angular_D !== undefined) {
      resolved.angular_D = msg.angular_D;
    }
    else {
      resolved.angular_D = 0.0
    }

    return resolved;
    }
};

module.exports = PIDS;
