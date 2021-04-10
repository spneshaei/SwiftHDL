//
//  Builder.swift
//  SwiftHDL
//
//  Created by Seyyed Parsa Neshaei on 4/10/21.
//

import Foundation

func Module(name: String, inputs: [Wire], outputs: [Wire], @Component component: () -> Component) -> Component {
    return component().with(name: name, inputs: inputs, outputs: outputs)
}
