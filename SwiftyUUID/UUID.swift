//
//  UUID.swift
//  SwiftyUUID
//
//  Created by Douglas Richardson on 8/7/15.
//
//

public typealias UUIDBytes = [UInt8]

// Generate a RFC 4122, version 4 UUID as a byte slice.
public func Version4UUID() -> UUIDBytes {
    var uuid : [UInt8] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    uuid.withUnsafeMutableBufferPointer { (inout p : UnsafeMutableBufferPointer<UInt8>) -> () in
        arc4random_buf(p.baseAddress, 16)
    }
    
    // Set the version and variant fields as described in RFC4122 sections
    // 4.1.1 and 4.1.3.
    // https://tools.ietf.org/html/rfc4122
    
    markRFC4122_INTERNAL(&uuid)
    
    return uuid
}

// bytes must be length 16. This is public for unit testing purposes but should
// not be used directly.
public func markRFC4122_INTERNAL(inout uuid : UUIDBytes) {
    uuid[6] = (uuid[6] & 0b00001111) | 0b01000000 // RFC 4122 version
    uuid[8] = (uuid[8] & 0b00111111) | 0b10000000 // RFC 4122 variant
}