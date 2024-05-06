//
//  Inspection.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 01/05/2024.
//

/*
From: https://github.com/nalexn/ViewInspector/blob/0.9.7/guide.md#approach-2
*/

import Combine
import SwiftUI

internal final class Inspection<V> {

    let notice = PassthroughSubject<UInt, Never>()
    var callbacks = [UInt: (V) -> Void]()

    func visit(_ view: V, _ line: UInt) {
        if let callback = callbacks.removeValue(forKey: line) {
            callback(view)
        }
    }
}
