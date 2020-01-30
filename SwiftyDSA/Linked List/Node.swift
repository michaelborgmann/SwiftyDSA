//
//  Node.swift
//  SwiftyDSA
//
//  Created by Michael Borgmann on 28.01.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation

public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(next.description)"
    }
    
}
