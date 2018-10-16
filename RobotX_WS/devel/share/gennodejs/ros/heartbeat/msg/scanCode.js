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

class scanCode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgID = null;
      this.date = null;
      this.time = null;
      this.teamID = null;
      this.lightPat = null;
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
      if (initObj.hasOwnProperty('lightPat')) {
        this.lightPat = initObj.lightPat
      }
      else {
        this.lightPat = '';
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
    // Serializes a message object of type scanCode
    // Serialize message field [msgID]
    bufferOffset = _serializer.string(obj.msgID, buffer, bufferOffset);
    // Serialize message field [date]
    bufferOffset = _serializer.string(obj.date, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.string(obj.time, buffer, bufferOffset);
    // Serialize message field [teamID]
    bufferOffset = _serializer.string(obj.teamID, buffer, bufferOffset);
    // Serialize message field [lightPat]
    bufferOffset = _serializer.string(obj.lightPat, buffer, bufferOffset);
    // Serialize message field [checksum]
    bufferOffset = _serializer.int32(obj.checksum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type scanCode
    let len;
    let data = new scanCode(null);
    // Deserialize message field [msgID]
    data.msgID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [date]
    data.date = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [teamID]
    data.teamID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [lightPat]
    data.lightPat = _deserializer.string(buffer, bufferOffset);
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
    length += object.lightPat.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat/scanCode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd47ab8bea2ce4a5939332c95bde635eb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgID
    string date
    string time
    string teamID
    string lightPat
    int32 checksum
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new scanCode(null);
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

    if (msg.lightPat !== undefined) {
      resolved.lightPat = msg.lightPat;
    }
    else {
      resolved.lightPat = ''
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

module.exports = scanCode;
