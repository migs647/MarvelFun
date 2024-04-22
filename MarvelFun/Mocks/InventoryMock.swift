//
//  InventoryMock.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import Foundation

class ComicBooksInventoryMock: Inventory {
    @Published var comicBooks: [Comic] = [
        Comic(id: 32,
              title: "Ant-Man #1 Issue",
              thumbnail: ImageData(path: "test/wherearewe", imageExtension: "jpg"),
              description: "An amazing amount of text that Ant-Man must process in order to survive!",
              upc: "abc123456defA")
        ]
    @Published var selectedComic: Comic?
    
    func currentComics() async throws -> [Comic] {
        return [Comic(id: 32,
                      title: "Ant-Man #1 Issue",
                      thumbnail: ImageData(path: "test/wherearewe", imageExtension: "jpg"),
                      description: "An amazing amount of text that Ant-Man must process in order to survive!",
                      upc: "abc123456defA")]
    }
}
