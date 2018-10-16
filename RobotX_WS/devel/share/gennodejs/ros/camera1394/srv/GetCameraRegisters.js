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

class GetCameraRegistersRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.offset = null;
      this.num_regs = null;
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
      if (initObj.hasOwnProperty('num_regs')) {
        this.num_regs = initObj.num_regs
      }
      else {
        this.num_regs = 0;
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
    // Serializes a message object of type GetCameraRegistersRequest
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [offset]
    bufferOffset = _serializer.uint64(obj.offset, buffer, bufferOffset);
    // Serialize message field [num_regs]
    bufferOffset = _serializer.uint32(obj.num_regs, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.uint32(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetCameraRegistersRequest
    let len;
    let data = new GetCameraRegistersRequest(null);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [offset]
    data.offset = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [num_regs]
    data.num_regs = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'camera1394/GetCameraRegistersRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3899ed32cc2bf9b6257abe5965b09162';
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
    
    uint32 num_regs
    
    uint32 mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetCameraRegistersRequest(null);
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

    if (msg.num_regs !== undefined) {
      resolved.num_regs = msg.num_regs;
    }
    else {
      resolved.num_regs = 0
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
GetCameraRegistersRequest.Constants = {
  TYPE_CONTROL: 0,
  TYPE_ABSOLUTE: 1,
  TYPE_FORMAT7: 2,
  TYPE_ADVANCED_CONTROL: 3,
  TYPE_PIO: 4,
  TYPE_SIO: 5,
  TYPE_STROBE: 6,
}

class GetCameraRegistersResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetCameraRegistersResponse
    // Serialize message field [value]
    bufferOffset = _arraySerializer.uint32(obj.value, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetCameraRegistersResponse
    let len;
    let data = new GetCameraRegistersResponse(null);
    // Deserialize message field [value]
    data.value = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.value.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'camera1394/GetCameraRegistersResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4680a08e992f8f11add4bc58e31c78a7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    uint32[] value
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetCameraRegistersResponse(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetCameraRegistersRequest,
  Response: GetCameraRegistersResponse,
  md5sum() { return '9597d397bc64c4c4fcaf24bbb15f0256'; },
  datatype() { return 'camera1394/GetCameraRegisters'; }
};
