//
//  ProtocolNavigationSavePath.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 02/05/2024.
//
// Modified from 
import Foundation
import SwiftUI

fileprivate let savePath = URL.documentsDirectory.appending(path: "SavedPath")

protocol NavigationStore {
    var path: NavigationPath {
        get set
    }
    func save()
}

extension NavigationStore {
    func save() {
    guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
