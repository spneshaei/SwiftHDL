//
//  main.swift
//  SwiftHDL
//
//  Created by Seyyed Parsa Neshaei on 4/10/21.
//

import Foundation


var wire1 = Wire(name: "wire1", values: [1])
var wire2 = Wire(name: "wire2", values: [0])
var wire3 = Wire(name: "wire3", width: 1)
var module = Module(name: "hi", inputs: [wire1, wire2], outputs: [wire3]) {
    And(inputs: [wire1, wire2], result: wire3)
    And(inputs: [wire1, wire2], result: wire3)
    Module(name: "hello", inputs: [wire1, wire2], outputs: [wire3]) {
        And(inputs: [wire1, wire2], result: wire3)
    }
}
print(module.generateVerilog().string)






