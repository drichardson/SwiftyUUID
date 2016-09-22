//
//  UUID.swift
//  SwiftyUUID
//
//  Created by Doug Richardson on 8/7/15.
//
//

/// An array of UUID bytes. When returned from functions you can assume it is a valid
/// 16 byte UUID. If creating your own, ensure it is 16 bytes long.
public typealias UUIDBytes = [UInt8]

/**
    Wrapper for UUIDBytes, providing immutability and support for extensions.
*/
public struct UUID {
    let bytes : UUIDBytes
    
    /// Create a randomly generated, version 4 UUID.
    public init() {
        bytes = Version4UUID()
    }
    
    /**
        Wrap UUIDBytes.
    
        :params: bytes The UUID bytes to use. Must be 16 bytes long.
    */
    public init(bytes : UUIDBytes) {
        assert(bytes.count == 16)
        self.bytes = bytes
    }
}

extension UUID {
    /**
        Get a string representation of the UUID of the form
        xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, where x is a lowercase
        hex digit.
    
        - returns: A string representation of the UUID.
    */
    public func CanonicalString() -> String {
        let args : [CVarArg] = [
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

/// Compare two UUIDs for equality. Two UUIDs are equal if their underlying bytes are equal.
public func ==(lhs: UUID, rhs: UUID) -> Bool {
    return lhs.bytes == rhs.bytes
}
