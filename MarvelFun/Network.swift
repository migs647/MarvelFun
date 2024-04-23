//
//  Network.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import Foundation

/// Main Network class helps with mock injection along with API specific handling.
/// Note: Next iteration should deal with handling other http status codes.
struct Network {
    
    static let shared: Network = Network()
    
    var session: URLSession? = nil
    
    func fetch<T: Codable>(from urlString: String) async throws -> T {
        
        var urlSession = URLSession.shared
        if let session = session {
            urlSession = session
        }
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await urlSession.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return result
    }
}
