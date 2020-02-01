//
//  StackTests.swift
//  SwiftyDSATests
//
//  Created by Michael Borgmann on 01.02.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

 import XCTest
 @testable import SwiftyDSA

 class StackTests: XCTestCase {
    
    var sut: Stack<Int>?
    let element = 23
     
     override func setUp() {
        super.setUp()
        sut = Stack<Int>()
     }

     override func tearDown() {
        sut = nil
        super.tearDown()
     }
     
    func testInit_createsStack() {
        XCTAssertNotNil(sut)
     }
    
    func testInit_whenCreated_stackIsEmpty() {
        XCTAssertTrue(sut!.isEmpty)
    }
    
    func testInitElements_withArray_createsStackFromArray() {
        let array = [1, 2, 3, 4]
        
        let stack = Stack(array)
        
        XCTAssertEqual(stack.peek(), 4)
    }
    
    func testInitArrayLiteral_createsStackFromArrayLiteral() {
        let stack: Stack = [1.0, 2.0, 3.0, 4.0]
        
        XCTAssertEqual(stack.peek(), 4.0)
    }
    
    func testPushElement_addElementToStack() {
        sut!.push(element)
        
        XCTAssertTrue(!sut!.isEmpty)
    }
    
    func testPeek_showsTopElement() {
        sut!.push(element)
        
        let peek = sut!.peek()
        
        XCTAssertEqual(peek, element)
    }
    
    func testPop_returnsTopElement() {
        sut!.push(element)
        
        let popped = sut!.pop()
        
        XCTAssertEqual(popped, element)
    }
    
    func testPop_afterPopping_removesTopElement() {
        sut!.push(element)
        
        sut!.pop()
        
        XCTAssertTrue(sut!.isEmpty)
    }

}
