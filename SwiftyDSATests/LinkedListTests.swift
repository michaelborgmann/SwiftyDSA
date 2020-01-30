//
//  LinkedListTests.swift
//  SwiftyDSATests
//
//  Created by Michael Borgmann on 28.01.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import XCTest
@testable import SwiftyDSA

class LinkedListTests: XCTestCase {
    
    var sut: LinkedList<Int>!
    var value: Int!
    
    override func setUp() {
        super.setUp()
        value = 23
        sut = LinkedList<Int>()
    }

    override func tearDown() {
        sut = nil
        value = nil
        super.tearDown()
    }
    
    func testInit_createsLinkedList() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_whenCreatedList_isEmpty() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func testPushValue_addHeadNode() {
        sut.push(value)
        
        XCTAssertEqual(sut.head?.value, value)
    }
    
    func testPushValue_whenEmpty_setTailToHead() {
        sut.push(value)
        
        XCTAssert(sut.tail === sut.head)
    }
    
    func testPushValue_listNotEmpty_linkNewHeadToOldHead() {
        sut.push(value)
        
        let oldHead = sut.head
        sut.push(42)
                        
        XCTAssert(sut.head?.next === oldHead)
    }
    
    func testAppendValue_listEmpty_pushValueToHead() {
        sut.append(value)
        
        XCTAssertNotNil(sut.head)
    }
    
    func testAppendValue_listEmpty_setTailToHead() {
        sut.append(value)
        
        XCTAssert(sut.tail === sut.head)
    }
    
    func testAppendValue_listNotEmpty_addTailNode() {
        sut.append(value)
        
        let oldTail = sut.tail
        sut.append(42)
        
        XCTAssert(sut.tail === oldTail?.next)
    }
    
    func testNodeAtIndex_forOne_returnNextNodeAfterHead() {
        sut.append(1); sut.append(2); sut.append(3)
        
        let node = sut.node(at: 1)
        
        XCTAssert(node === sut.head!.next)
    }
    
    func testInsertValue_afterTailNode_insertAsTailNode() {
        sut.push(0)
        
        sut.insert(value, after: sut.head!)

        XCTAssert(sut.head!.next === sut.tail)
    }
    
    func testInsertValue_withinListAfterHeadNode_insertsNodeAfterHead() {
        sut.push(2); sut.push(1); sut.push(0)
        
        sut.insert(value, after: sut.head!)
        
        XCTAssertEqual(sut.head!.next!.value, value)
    }

    func testPop_returnOldHeadValue() {
        sut.push(2); sut.push(1); sut.push(0)
        
        let value = sut.pop()
        
        XCTAssertEqual(value, 0)
    }
    
    func testPop_movesHeadToNextNode() {
        sut.push(2); sut.push(1); sut.push(0)
        
        let next = sut.head!.next
        sut.pop()
        
        XCTAssert(sut.head! === next!)
    }
    
    func testPop_becomesEmpty_setTailToNil() {
        sut.push(value)
        
        sut.pop()
        
        XCTAssertNil(sut.tail)
    }
    
    
    func testRemoveLast_whenEmpty_returnNil() {
        let value = sut.removeLast()
        
        XCTAssertNil(value)
    }
    
    func testRemoveLast_oneNodeInList_justPopNode() {
        sut.push(value)
        
        let node = sut.node(at: 0)
        let value = sut.removeLast()
        
        XCTAssertEqual(value, node?.value)
    }
    
    func testRemoveLast_removesLastNode() {
        sut.push(2); sut.push(1); sut.push(0)
        
        let penultimateNode = sut.node(at: 1)
        sut.removeLast()
        
        XCTAssert(sut.tail === penultimateNode)
    }
    
    func testRemoveAfter_unlinksNode() {
        sut.push(2); sut.push(1); sut.push(0)
        
        sut.remove(after: sut.head!)
        
        XCTAssert(sut.head?.next === sut.tail)
    }
    
    func testRemoveAfter_returnsUnlinkedNodeValue() {
        sut.push(2); sut.push(1); sut.push(0)
        
        let value = sut.remove(after: sut.head!)
        
        XCTAssertEqual(value, 1)
    }
    
    func testRemoveAfter_whenRemovingTail_updateTail() {
        sut.push(2); sut.push(1); sut.push(0)
        
        sut.remove(after: sut.head!.next!)
        
        XCTAssert(sut.tail === sut.head!.next)
    }
    
}
