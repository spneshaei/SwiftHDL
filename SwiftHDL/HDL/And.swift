//
//  And.swift
//  SwiftHDL
//
//  Created by Seyyed Parsa Neshaei on 4/10/21.
//

import Foundation

public class And: Component {
    
    init(inputs: [Wire], result: Wire) {
        super.init(name: "and_gate", inputs: inputs, outputs: [result])
    }
    
    public override func generateVerilog() -> Verilog {
        return Verilog(string: """
module and_gate(inputone, inputtwo, result);
input \(inputs[0].values.count == 1 ? "" : "[\(inputs[0].values.count - 1):0]")inputone;
input \(inputs[1].values.count == 1 ? "" : "[\(inputs[1].values.count - 1):0] ")inputtwo;
output result;
wire w1, w2;
assign w1 = &inputone;
assign w2 = &inputtwo;
assign result = w1 & w2;
endmodule
""")
    }
}
