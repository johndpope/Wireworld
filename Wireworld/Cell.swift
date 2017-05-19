//
//  Cell.swift
//  Wireworld
//
//  Created by nst on 12.05.17.
//  Copyright © 2017 Nicolas Seriot. All rights reserved.
//

import AppKit

enum CellState: String {
    
    case empty
    case wire
    case tail
    case head
    
    init?(rawValue: String) {
        switch rawValue {
        case "head":
            self = .head
        case "tail":
            self = .tail
        case "wire":
            self = .wire
        case "empty":
            self = .empty
        default:
            self = .empty
            assertionFailure()
        }
    }
    
    var color: NSColor {
        get {
            switch self {
            case .head:
                return NSColor.red
            case .tail:
                return NSColor.blue
            case .wire:
                return NSColor.yellow
            case .empty:
                return NSColor.black
            }
        }
    }
    
}

class Cell: NSObject, MatrixCell {
    required override init() {
        super.init()
    }
    
    init(state: CellState) {
        self.state = state
    }
    
    var state: CellState = .empty
    var futureState: CellState? = nil
}
