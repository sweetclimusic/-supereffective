//
//  FavoriteProtocol.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 15/05/2024.
//

import Foundation

protocol FavoriteManager {
    associatedtype T
    func add(byId: T)
    func remove(byId: T)
    func load()
    func store()
}
