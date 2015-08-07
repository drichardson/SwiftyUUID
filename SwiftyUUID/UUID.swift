//
//  UUID.swift
//  SwiftyUUID
//
//  Created by Douglas Richardson on 8/7/15.
//
//

// Wraps UUID bytes, providing methods for converting to/from string representations.
public struct UUID {
    let bytes : UUIDBytes
    
    // Create a Version 4 UUID.
    public init() {
        bytes = Version4UUID()
    }
    
    // Use pre-generated UUIDBytes. This is intended for testing and you probably
    // should use init() instead.
    public init(bytes : UUIDBytes) {
        assert(bytes.count == 16)
        self.bytes = bytes
    }
}

extension UUID {
    // Get a string representation of the UUID of the form xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx,
    // where x is a hex digit.
    public func CanonicalString() -> String {
        let args : [CVarArgType] = [
            bytes[0], bytes[1], bytes[2], bytes[3],
            bytes[4], bytes[5], bytes[6], bytes[7],
            bytes[8], bytes[9], bytes[10], bytes[11],
            bytes[12], bytes[13], bytes[14], bytes[15]
        ]
        
        return String(format: "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", arguments: args)
    }
}

extension UUID : Equatable {
}

public func ==(lhs: UUID, rhs: UUID) -> Bool {
    return lhs.bytes == rhs.bytes
}