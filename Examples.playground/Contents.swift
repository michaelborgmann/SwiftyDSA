import UIKit
import SwiftyDSA


example(of: "using a stack") {
    var stack = Stack<Int>()

    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let element = stack.pop() {
        assert(element == 4)
        print("Popped: \(element)")
    }
    
    print(stack)
}

example(of: "initialize stack from array") {
    let array = ["A", "B", "C"]
    let stack = Stack(array)
    print(stack)
}

example(of: "initialize stack from array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
}

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)

    node1.next = node2
    node2.next = node3

    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    
    list.append(1)
    list.append(2)
    list.append(3)
    
    print(list)
}

example(of: "insert at particular index") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before inserting: \(list)")
    
    let node = list.node(at: 1)!
    
    list.insert(0, after: node)
    
    print("After inserting: \(list)")
}

example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before popping list: \(list)")
    
    let value = list.pop()
    
    print("After popping list: \(list)")
    print("Popped value: \(String(describing: value))")
}

example(of: "removing last node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing last node: \(list)")
    let value = list.removeLast()
    
    print("After removing last node: \(list)")
    print("Removed value: \(String(describing: value))")
}
