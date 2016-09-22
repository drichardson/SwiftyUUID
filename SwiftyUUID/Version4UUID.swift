//
//  Version4UUID.swift
//  SwiftyUUID
//
//  Created by Doug Richardson on 8/7/15.
//
//

/**
    Generate a new RFC 4122, version 4 (random) UUID.
    
    - returns: The new, randomly generated UUID.
*/
public func Version4UUID() -> UUIDBytes {
    var uuid : [UInt8] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    uuid.withUnsafeMutableBufferPointer { (p : inout UnsafeMutableBufferPointer<UInt8>) -> () in
        arc4random_buf(p.baseAddress, 16)
    }
    
    // Set the version and variant fields as described in RFC4122 sections
    // 4.1.1 and 4.1.3.
    // https://tools.ietf.org/html/rfc4122
    
    markRFC4122_INTERNAL(&uuid)
    
    return uuid
}

/**
    Set the RFC 4122 version and variant fields. This method is only
    public for the purposes of unit testing. You should not use it.

    :params: uuid The 16 byte uuid to mark.
*/
public func markRFC4122_INTERNAL(_ uuid : inout UUIDBytes) {
    uuid[6] = (uuid[6] & 0b00001111) | 0b01000000 // RFC 4122 version
    uuid[8] = (uuid[8] & 0b00111111) | 0b10000000 // RFC 4122 variant
}
