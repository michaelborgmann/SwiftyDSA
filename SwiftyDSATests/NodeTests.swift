//
//  LinkedListTests.swift
//  SwiftyDSATests
//
//  Created by Michael Borgmann on 28.01.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import XCTest
@testable import SwiftyDSA

class NodeTests: XCTestCase {
    
    var sut: Node<Int>!
    var value: Int!
    var next: Node<Int>?

    override func setUp() {
        super.setUp()
        value = 23
        sut = Node(value: value, next: next)
    }

    override func tearDown() {
        sut = nil
        value = nil
        next = nil
        super.tearDown()
    }
    
    func testInitValue_setsValue() {
        XCTAssertEqual(sut.value, value)
    }
    
    func testInitNext_whenNotSet_nextIsNil() {
        XCTAssertNil(sut.next)
    }
    
    func testInitNext_whenSet_pointsToAnotherNode() {
        let next = Node(value: 42)
        
        sut = Node(value: value, next: next)
        
        XCTAssert(sut.next === next)
    }

}
