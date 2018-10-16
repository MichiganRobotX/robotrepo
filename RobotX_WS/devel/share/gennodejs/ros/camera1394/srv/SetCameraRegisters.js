// Auto-generated. Do not edit!

// (in-package camera1394.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetCameraRegistersRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.offset = null;
      this.value = null;
      this.mode = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('offset')) {
        this.offset = initObj.offset
      }
      else {
        this.offset = 0;
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = [];
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetCameraRegistersRequest
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [offset]
    bufferOffset = _serializer.uint64(obj.offset, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _arraySerializer.uint32(obj.value, buffer, bufferOffset, null);
    // Serialize message field [mode]
    bufferOffset = _serializer.uint32(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCameraRegistersRequest
    let len;
    let data = new SetCameraRegistersRequest(null);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [offset]
    data.offset = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [mode]
    data.mode = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.value.length;
    return length + 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'camera1394/SetCameraRegistersRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '703211788a5d6f08f820dfb1792ab51c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    uint8 TYPE_CONTROL=0
    uint8 TYPE_ABSOLUTE=1
    uint8 TYPE_FORMAT7=2
    uint8 TYPE_ADVANCED_CONTROL=3
    uint8 TYPE_PIO=4
    uint8 TYPE_SIO=5
    uint8 TYPE_STROBE=6
    
    uint8 type
    
    uint64 offset
    
    uint32[] value
    
    uint32 mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetCameraRegistersRequest(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.offset !== undefined) {
      resolved.offset = msg.offset;
    }
    else {
      resolved.offset = 0
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = []
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    return resolved;
    }
};

// Constants for message
SetCameraRegistersRequest.Constants = {
  TYPE_CONTROL: 0,
  TYPE_ABSOLUTE: 1,
  TYPE_FORMAT7: 2,
  TYPE_ADVANCED_CONTROL: 3,
  TYPE_PIO: 4,
  TYPE_SIO: 5,
  TYPE_STROBE: 6,
}

class SetCameraRegistersResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetCameraRegistersResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCameraRegistersResponse
    let len;
    let data = new SetCameraRegistersResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'camera1394/SetCameraRegistersResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetCameraRegistersResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetCameraRegistersRequest,
  Response: SetCameraRegistersResponse,
  md5sum() { return '703211788a5d6f08f820dfb1792ab51c'; },
  datatype() { return 'camera1394/SetCameraRegisters'; }
};
