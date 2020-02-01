//
//  Stack.swift
//  SwiftyDSA
//
//  Created by Michael Borgmann on 01.02.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() {}
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        """
        ---- top ----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -------------
        """
    }
    
}
