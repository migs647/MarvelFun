//
//  Network.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import Foundation

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
