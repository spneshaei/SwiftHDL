//
//  Utility.swift
//  SwiftHDL
//
//  Created by Seyyed Parsa Neshaei on 4/10/21.
//

import Foundation

public class Utility {
    public static func classNameAsString(_ object: Any) -> String {
        return String(describing: type(of: object))
    }
    
    public static func randomSafeString() -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

extension String {
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}
