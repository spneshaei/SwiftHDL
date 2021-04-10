//
//  Wire.swift
//  SwiftHDL
//
//  Created by Seyyed Parsa Neshaei on 4/10/21.
//

import Foundation

public class Wire {
    public var name: String
    public var width: Int
    public var values: [Int] = []
    
    init(name: String, width: Int) {
        self.name = name
        self.width = width
    }
    
    init(name: String, values: [Int]) {
        self.name = name
        self.values = values
        self.width = values.count
    }
}
