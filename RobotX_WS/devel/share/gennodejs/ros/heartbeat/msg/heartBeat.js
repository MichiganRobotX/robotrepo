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

class heartBeat {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgID = null;
      this.date = null;
      this.time = null;
      this.latitude = null;
      this.longitude = null;
      this.NS = null;
      this.EW = null;
      this.teamID = null;
      this.sysMode = null;
      this.AUVStatus = null;
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
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('NS')) {
        this.NS = initObj.NS
      }
      else {
        this.NS = '';
      }
      if (initObj.hasOwnProperty('EW')) {
        this.EW = initObj.EW
      }
      else {
        this.EW = '';
      }
      if (initObj.hasOwnProperty('teamID')) {
        this.teamID = initObj.teamID
      }
      else {
        this.teamID = '';
      }
      if (initObj.hasOwnProperty('sysMode')) {
        this.sysMode = initObj.sysMode
      }
      else {
        this.sysMode = 0;
      }
      if (initObj.hasOwnProperty('AUVStatus')) {
        this.AUVStatus = initObj.AUVStatus
      }
      else {
        this.AUVStatus = 0;
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
    // Serializes a message object of type heartBeat
    // Serialize message field [msgID]
    bufferOffset = _serializer.string(obj.msgID, buffer, bufferOffset);
    // Serialize message field [date]
    bufferOffset = _serializer.string(obj.date, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.string(obj.time, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float32(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float32(obj.longitude, buffer, bufferOffset);
    // Serialize message field [NS]
    bufferOffset = _serializer.string(obj.NS, buffer, bufferOffset);
    // Serialize message field [EW]
    bufferOffset = _serializer.string(obj.EW, buffer, bufferOffset);
    // Serialize message field [teamID]
    bufferOffset = _serializer.string(obj.teamID, buffer, bufferOffset);
    // Serialize message field [sysMode]
    bufferOffset = _serializer.int32(obj.sysMode, buffer, bufferOffset);
    // Serialize message field [AUVStatus]
    bufferOffset = _serializer.int32(obj.AUVStatus, buffer, bufferOffset);
    // Serialize message field [checksum]
    bufferOffset = _serializer.int32(obj.checksum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type heartBeat
    let len;
    let data = new heartBeat(null);
    // Deserialize message field [msgID]
    data.msgID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [date]
    data.date = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [NS]
    data.NS = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [EW]
    data.EW = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [teamID]
    data.teamID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sysMode]
    data.sysMode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [AUVStatus]
    data.AUVStatus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [checksum]
    data.checksum = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.msgID.length;
    length += object.date.length;
    length += object.time.length;
    length += object.NS.length;
    length += object.EW.length;
    length += object.teamID.length;
    return length + 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat/heartBeat';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e916e349c3a6e892f5964e2d9636882';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgID
    string date
    string time
    float32 latitude
    float32 longitude
    string NS
    string EW
    string teamID
    int32 sysMode
    int32 AUVStatus
    int32 checksum
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new heartBeat(null);
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

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.NS !== undefined) {
      resolved.NS = msg.NS;
    }
    else {
      resolved.NS = ''
    }

    if (msg.EW !== undefined) {
      resolved.EW = msg.EW;
    }
    else {
      resolved.EW = ''
    }

    if (msg.teamID !== undefined) {
      resolved.teamID = msg.teamID;
    }
    else {
      resolved.teamID = ''
    }

    if (msg.sysMode !== undefined) {
      resolved.sysMode = msg.sysMode;
    }
    else {
      resolved.sysMode = 0
    }

    if (msg.AUVStatus !== undefined) {
      resolved.AUVStatus = msg.AUVStatus;
    }
    else {
      resolved.AUVStatus = 0
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

module.exports = heartBeat;
