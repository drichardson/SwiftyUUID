//
//  SwiftyUUIDTests.swift
//  SwiftyUUIDTests
//
//  Created by Doug Richardson on 8/7/15.
//
//

import XCTest
import SwiftyUUID

class SwiftyUUIDTests: XCTestCase {
    
    func testUUIDEquality() {
        let uuidBytes1 = SwiftyUUID.Version4UUID()
        let uuidBytes2 = SwiftyUUID.Version4UUID()
        XCTAssertNotEqual(uuidBytes1, uuidBytes2)
        
        let uuid1 = SwiftyUUID.UUID()
        let uuid2 = SwiftyUUID.UUID()
        let uuid1Copy = uuid1
        XCTAssertNotEqual(uuid1, uuid2)
        XCTAssertEqual(uuid1, uuid1Copy)
    }
    
    func testUUIDVersion4() {
        // https://tools.ietf.org/html/rfc4122#section-4.1.3
        let uuid = SwiftyUUID.Version4UUID()
        XCTAssertEqual((uuid[6] & 0b11110000) >> 4, 0b0100)
    }
    
    func testUUIDVariant() {
        // https://tools.ietf.org/html/rfc4122#section-4.1.1
        let uuid = SwiftyUUID.Version4UUID()
        XCTAssertEqual((uuid[8] & 0b11000000) >> 6, 0b10)
    }
    
    func testUUIDLength() {
        let uuid = SwiftyUUID.Version4UUID()
        XCTAssertEqual(uuid.count, 16)
    }
    
    func testRFC4122Conformance() {
        // Because the other methods randomly generate their UUID, this
        // test uses fake UUIDs to hit edge cases every time the test is
        // run so that unit test failures are repeatable.
        var uuid_allOnes : [UInt8] = [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]
        var uuid_allZeros : [UInt8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        XCTAssertEqual(uuid_allOnes.count, 16)
        XCTAssertEqual(uuid_allZeros.count, 16)
        XCTAssertNotEqual((uuid_allOnes[6] & 0b11110000) >> 4, 0b0100)
        XCTAssertNotEqual((uuid_allZeros[6] & 0b11110000) >> 4, 0b0100)
        XCTAssertNotEqual((uuid_allOnes[8] & 0b11000000) >> 6, 0b10)
        XCTAssertNotEqual((uuid_allZeros[8] & 0b11000000) >> 6, 0b10)
        
        SwiftyUUID.markRFC4122_INTERNAL(&uuid_allOnes)
        SwiftyUUID.markRFC4122_INTERNAL(&uuid_allZeros)
        
        XCTAssertEqual(uuid_allOnes.count, 16)
        XCTAssertEqual(uuid_allZeros.count, 16)
        XCTAssertEqual((uuid_allOnes[6] & 0b11110000) >> 4, 0b0100)
        XCTAssertEqual((uuid_allZeros[6] & 0b11110000) >> 4, 0b0100)
        XCTAssertEqual((uuid_allOnes[8] & 0b11000000) >> 6, 0b10)
        XCTAssertEqual((uuid_allZeros[8] & 0b11000000) >> 6, 0b10)
    }
    
    func testCanonicalStrings() {
        let uuid_allOnes : [UInt8] = [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]
        let uuid_allZeros : [UInt8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        let uuid_bookendOnes : [UInt8] = [0x10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01]
        
        // Note, I'm actually using non-conformant version 4 UUIDs in this test (version and
        // variant are not set correctly).
        let uuidOnes = SwiftyUUID.UUID(bytes: uuid_allOnes)
        let uuidZeros = SwiftyUUID.UUID(bytes: uuid_allZeros)
        let uuidBookendOnes = SwiftyUUID.UUID(bytes: uuid_bookendOnes)
        XCTAssertEqual(uuidOnes.CanonicalString(),  "ffffffff-ffff-ffff-ffff-ffffffffffff")
        XCTAssertEqual(uuidZeros.CanonicalString(), "00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(uuidBookendOnes.CanonicalString(), "10000000-0000-0000-0000-000000000001")
    }
    
    func testPerformanceVersion4UUID() {
        self.measure() {
            for _ in 1...10000 {
                _ = SwiftyUUID.Version4UUID()
            }
        }
    }
    
    func testPerformanceCanonicalStrings() {
        let uuid = SwiftyUUID.UUID()
        self.measure() {
            for _ in 1...1000 {
                _ = uuid.CanonicalString()
            }
        }
    }
}
