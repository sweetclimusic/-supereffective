//
//  HandlerProtocol.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 01/05/2024.
//

import Foundation

public typealias Handler<T> = (() -> T)
public typealias VoidHandler = Handler<Void>
