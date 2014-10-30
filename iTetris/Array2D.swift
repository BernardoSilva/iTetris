//
//  Array2D.swift
//  iTetris
//
//  Created by Bernardo Silva on 30/10/2014.
//  Copyright (c) 2014 Bernardo Silva. All rights reserved.
//
// This is a class declaration because classes are passed by reference and we need this
// data structure to persist accross the entire game.

class Array2D<T> {
    let columns: Int
    let rows: Int
    
    // Allow this array to receive any type of data.
    // The ? represents an optional value.
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        // Initialize the internal array structure.
        array = Array<T?>(count:rows *  columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) ->T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
    
}
