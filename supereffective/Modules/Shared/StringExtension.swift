//
//  StringExtension.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 04/05/2024.
//

import Foundation
extension String {
    /// Extract the initial substring up to the index.
    /// parameter index: The index of the character to cut the string off at
     
    ///returns: The string after to the specified index until the end.
    public func idFromUrl(_ startRange: String) -> Int? {
        guard self.contains(startRange), let range = self.range(of: startRange)
        else {
            return nil
        }
        let distance = self.distance(from: range.upperBound, to: self.endIndex)
        
        var result = self
        result.removeSubrange(range)
        guard let extractedId = try? Int(result, format: .number) else { return nil }
        return extractedId
    }
}
