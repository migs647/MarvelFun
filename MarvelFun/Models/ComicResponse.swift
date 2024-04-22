//
//  Comic.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import Foundation

struct ComicResponse: Codable {
    let attribution: String
    let comics: ComicData
    
    private enum CodingKeys: String, CodingKey {
        case attribution = "attributionText"
        case comics = "data"
    }
}

struct ComicData: Codable {
    let comics: [Comic]
    
    private enum CodingKeys: String, CodingKey {
        case comics = "results"
    }
}

struct Comic: Codable, Hashable {
    static func == (lhs: Comic, rhs: Comic) -> Bool {
        lhs.id == rhs.id && 
        lhs.title == rhs.title &&
        lhs.upc == rhs.upc
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(id)
    }
    
    let id: Int
    let title: String
    let thumbnail: ImageData
    let description: String?
    let upc: String
    
    var isRead = false
    
    func thumbnailURL() -> URL? {
        if (thumbnail.path.contains("http")) {
            return URL(string: thumbnail.path+"."+thumbnail.imageExtension)
        } else if let fileURL = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(thumbnail.path+"."+thumbnail.imageExtension) {
            // Found file
            return fileURL
        }
        print("Could not find image")
        return nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, description, upc
    }
}

struct ImageData: Codable {
    let path: String
    let imageExtension: String
    
    private enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}
