//
//  ProtocolDoubles.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import Foundation

/// reimplementation of URLSession for testing and to mock the results of a URLSession request during testing.
///
///  This must implement the required open functions dataTask from URLSession, it must be defined the same to behave as 1:1 URLSession
protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
//    func dataTask(with request: URLRequest) -> URLSessionDataTask
}
/// reimplementation of UserDefault for testing and to mock the results of a URLSession request during testing.
protocol UserDefaultProtocol {}

extension URLSession: URLSessionProtocol{}
extension UserDefaults: UserDefaultProtocol {}
