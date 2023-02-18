//
//  Counter.swift
//  Tally App
//
//  Created by Jane Madsen on 2/16/23.
//

import Foundation

enum Direction {
    case up, down
}

class Counter {
    var value: Int
    var resetValue: Int
    var increment: Int
    var direction: Direction
    var title: String?
    
    init(value: Int = 0, resetValue: Int = 0, increment: Int = 1, direction: Direction = .up, title: String? = "Tally") {
        self.value = value
        self.resetValue = resetValue
        self.increment = increment
        self.direction = direction
        self.title = title
    }
}
