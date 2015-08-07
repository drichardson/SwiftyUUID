//
//  UUIDTests.swift
//  SwiftyUUID
//
//  Created by Douglas Richardson on 8/7/15.
//
//

import XCTest
import SwiftyUUID

class UUIDTest: XCTestCase {
    
    func testUUIDDifference() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        let uuid1 = SwiftyUUID.Version4UUID()
        let uuid2 = SwiftyUUID.Version4UUID()
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
    
    func testPerformanceVersion4UUID() {
        self.measureBlock() {
            for _ in 1...1000 {
                SwiftyUUID.Version4UUID()
            }
        }
    }
    
}
