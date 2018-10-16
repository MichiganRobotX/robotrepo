// Auto-generated. Do not edit!

// (in-package heartbeat.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class dockTask {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgID = null;
      this.date = null;
      this.time = null;
      this.teamID = null;
      this.shapeColor = null;
      this.shape = null;
      this.checksum = null;
    }
    else {
      if (initObj.hasOwnProperty('msgID')) {
        this.msgID = initObj.msgID
      }
      else {
        this.msgID = '';
      }
      if (initObj.hasOwnProperty('date')) {
        this.date = initObj.date
      }
      else {
        this.date = '';
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = '';
      }
      if (initObj.hasOwnProperty('teamID')) {
        this.teamID = initObj.teamID
      }
      else {
        this.teamID = '';
      }
      if (initObj.hasOwnProperty('shapeColor')) {
        this.shapeColor = initObj.shapeColor
      }
      else {
        this.shapeColor = '';
      }
      if (initObj.hasOwnProperty('shape')) {
        this.shape = initObj.shape
      }
      else {
        this.shape = '';
      }
      if (initObj.hasOwnProperty('checksum')) {
        this.checksum = initObj.checksum
      }
      else {
        this.checksum = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dockTask
    // Serialize message field [msgID]
    bufferOffset = _serializer.string(obj.msgID, buffer, bufferOffset);
    // Serialize message field [date]
    bufferOffset = _serializer.string(obj.date, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.string(obj.time, buffer, bufferOffset);
    // Serialize message field [teamID]
    bufferOffset = _serializer.string(obj.teamID, buffer, bufferOffset);
    // Serialize message field [shapeColor]
    bufferOffset = _serializer.string(obj.shapeColor, buffer, bufferOffset);
    // Serialize message field [shape]
    bufferOffset = _serializer.string(obj.shape, buffer, bufferOffset);
    // Serialize message field [checksum]
    bufferOffset = _serializer.int32(obj.checksum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dockTask
    let len;
    let data = new dockTask(null);
    // Deserialize message field [msgID]
    data.msgID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [date]
    data.date = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [teamID]
    data.teamID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [shapeColor]
    data.shapeColor = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [shape]
    data.shape = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [checksum]
    data.checksum = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.msgID.length;
    length += object.date.length;
    length += object.time.length;
    length += object.teamID.length;
    length += object.shapeColor.length;
    length += object.shape.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat/dockTask';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce0c58613dee387ebf511525a16db3e0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgID
    string date
    string time
    string teamID
    string shapeColor
    string shape
    int32 checksum
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dockTask(null);
    if (msg.msgID !== undefined) {
      resolved.msgID = msg.msgID;
    }
    else {
      resolved.msgID = ''
    }

    if (msg.date !== undefined) {
      resolved.date = msg.date;
    }
    else {
      resolved.date = ''
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = ''
    }

    if (msg.teamID !== undefined) {
      resolved.teamID = msg.teamID;
    }
    else {
      resolved.teamID = ''
    }

    if (msg.shapeColor !== undefined) {
      resolved.shapeColor = msg.shapeColor;
    }
    else {
      resolved.shapeColor = ''
    }

    if (msg.shape !== undefined) {
      resolved.shape = msg.shape;
    }
    else {
      resolved.shape = ''
    }

    if (msg.checksum !== undefined) {
      resolved.checksum = msg.checksum;
    }
    else {
      resolved.checksum = 0
    }

    return resolved;
    }
};

module.exports = dockTask;
