//
//  InventoryMock.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import Foundation

/// Convenience class for SwiftUI Previews and UITests
class ComicBooksInventoryMock: Inventory {
    
    @Published var comicBooks: [Comic] = [
        Comic(id: 32,
              title: "Ant-Man #1 Issue",
              thumbnail: ImageData(path: "test/wherearewe", imageExtension: "jpg"),
              description: "An amazing amount of text that Ant-Man must process in order to survive!",
              upc: "abc123456defA")
        ]
    
    @Published var selectedComic: Comic?
    
    
    /// An array (of 1) Comic used for UI Previews
    /// - Returns: Comic data of Ant-Man #1 Issue
    func currentComics() async throws -> [Comic] {
        return [Comic(id: 32,
                      title: "Ant-Man #1 Issue",
                      thumbnail: ImageData(path: "test/wherearewe", imageExtension: "jpg"),
                      description: "An amazing amount of text that Ant-Man must process in order to survive!",
                      upc: "abc123456defA")]
    }
    
    
    /// Get the data from a local file in the main bundle. Mainly utilized for testing and cache.
    /// - Parameters:
    ///   - name: The name of the file to load as data
    ///   - fileExtension: The extension of the file to load as data
    /// - Returns: The data if the
    static func readJSONFile(forName name: String, fileExtension: String) -> Data? {
        var resourceData: Data? = nil
        
        let testBundle = Bundle.main
        guard let resourceURL = testBundle.url(forResource: name, withExtension: fileExtension) else {
            // file does not exist
            return resourceData
        }
        do {
            resourceData = try Data(contentsOf: resourceURL)
        } catch {
            // Some error occurred when reading the file, swallow it and move on
            // Note: This could be re-thrown but since this is used for testing
            // it isn't important right now. Change this if it is repurposed for
            // cache.
            print("Could not mock parse data")
        }
        return resourceData
    }

}
