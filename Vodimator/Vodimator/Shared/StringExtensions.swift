//
//  StringExtensions.swift
//  Vodimator
//
//  Created by Darren Reely on 2/14/24.
//

import Foundation

extension String {
    // Can't handle newer domains like .photography so this is a potential problem.
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
