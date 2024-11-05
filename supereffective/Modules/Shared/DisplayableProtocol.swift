//
//  DisplayableProtocol.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 01/05/2024.
//

import SwiftUI

protocol Displayable {
    func setupDisplayable() -> any View
    var viewType: any View.Type { get }
}
