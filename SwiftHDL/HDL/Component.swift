//
//  Component.swift
//  SwiftHDL
//
//  Created by Seyyed Parsa Neshaei on 4/10/21.
//

import Foundation

@_functionBuilder
public class Component {
    
    public var name: String
    
    public var inputs: [Wire]
    public var outputs: [Wire]
    
    init(name: String, inputs: [Wire], outputs: [Wire]) {
        self.name = name
        self.inputs = inputs
        self.outputs = outputs
    }
    
    public func with(name: String, inputs: [Wire], outputs: [Wire]) -> Component {
        self.name = name
        self.inputs = inputs
        self.outputs = outputs
        return self
    }
    
    public var subComponents: [Component] = []
    
    public func generateVerilog() -> Verilog {
        var result = ""
        subComponents.forEach({
            if !Globals.generatedComponentNames.contains($0.name) {
                result.append($0.generateVerilog().string + "\n")
                Globals.generatedComponentNames.append($0.name)
            }
        })
        result.append("module \(self.name)(")
        inputs.forEach({
            result.append("\($0.name), ")
        })
        outputs.forEach({
            result.append("\($0.name), ")
        })
        result = result.deletingSuffix(", ")
        result.append(");\n")
        inputs.forEach {
            result.append("input \($0.values.count == 1 ? "" : "[\($0.values.count - 1):0] ")\($0.name);\n")
        }
        outputs.forEach {
            result.append("output \($0.values.count == 1 ? "" : "[\($0.values.count - 1):0] ")\($0.name);\n")
        }
//        subComponents.forEach({
//            $0.inputs[0].
//        })
        subComponents.forEach({
            result.append("\($0.name) \(Utility.randomSafeString())(")
            $0.inputs.forEach { input in
                result.append("\(input.name), ")
            }
            $0.outputs.forEach { output in
                result.append("\(output.name), ")
            }
            result = result.deletingSuffix(", ")
            result.append(");\n")
        })
        result.append("endmodule\n")
        return Verilog(string: result)
    }
    
    static func buildBlock(_ partialResults: Component...) -> Component {
        let currentComponent = Component(name: "", inputs: [], outputs: [])
        for component in partialResults {
            currentComponent.subComponents.append(component)
        }
        return currentComponent
    }
    
}
