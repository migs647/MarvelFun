//
//  ComicBooksInventory.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import Foundation

/// A generic protocol to allow dependency injection of comic inventory
protocol Inventory: ObservableObject {
    var comicBooks: [Comic] { get }
    var selectedComic: Comic? { get set }
    func currentComics() async throws -> [Comic]
}

/// The main ComicBooksInventory used throughout the application
final class ComicBooksInventory: Inventory {
    @MainActor @Published private(set) var comicBooks: [Comic] = []
    @MainActor @Published var selectedComic: Comic?
    private var latestTimestamp: String = ""
    
    @MainActor 
    func currentComics() async throws -> [Comic] {
       
        if comicBooks.isEmpty {
            do {
                let hash = try generateHash()
                let url = Constants.apiEndpointUrl + "?ts=\(latestTimestamp)&apikey=\(Constants.apiKey)&hash=\(hash)"
                
                let response: ComicResponse = try await Network().fetch(from: url)
                comicBooks = response.comics.comics
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return comicBooks
    }
    
    /// The logic for building out the correct hash key needed for the comics endpoint
    func generateHash() throws -> String {
        latestTimestamp = String(NSDate().timeIntervalSince1970)
        let hashFingerprint = "\(latestTimestamp)\(Constants.privateApiKey)\(Constants.apiKey)"
        return try hashFingerprint.MD5
    }
}
