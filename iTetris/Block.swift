//
//  Block.swift
//  iTetris
//
//  Created by Bernardo Silva on 30/10/2014.
//  Copyright (c) 2014 Bernardo Silva. All rights reserved.
//

import SpriteKit

// Declare the number of colours for blocks.
let NumberOfColors: UInt32 = 6

// Enum that implements the Printable Protocol.
// Learn more about Protocols:
// https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html
// NOTE: Classes, structures and enums which implement Printable are capable of generating human-readable strings
// when debugging or printing their value to the console.
enum BlockColor: Int, Printable {
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
            }
    }
    
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}


class Block: Hashable, Printable {
    // Use "let" to avoid the block to change colour during the game.
    let color: BlockColor
    
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}



func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}


