//
//  MarvelFunTests.swift
//  MarvelFunTests
//
//  Created by Cody on 4/21/24.
//

import XCTest
@testable import MarvelFun

final class MarvelFunTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        TestURLProtocol.loadingHandler = nil
    }
    
    func testLoadedDataSuccessfully() async throws {
        
        guard let responseJSONData = readJSONFile(forName: "Comic", fileExtension: "json") else {
            XCTFail("could not parse mock data")
            return
        }
        
        // Build a mock session configuration
        let configuration = TestURLProtocol.buildSessionConfiguration(data: responseJSONData)
        
        var networkClient = Network.shared
        networkClient.session = URLSession(configuration: configuration)
        let comic: Comic = try await networkClient.fetch(from: "http://www.example.com")

        XCTAssert(comic.title == "Ant-Man (2003) #1")
        XCTAssert(comic.upc == "5960605396-01811")
    }
    
    func readJSONFile(forName name: String, fileExtension: String) -> Data? {
        var resourceData: Data? = nil
        
        let testBundle = Bundle(for: type(of: self))
        guard let resourceURL = testBundle.url(forResource: name, withExtension: fileExtension) else {
            // file does not exist
            return resourceData
        }
        do {
            resourceData = try Data(contentsOf: resourceURL)
        } catch {
            // some error occurred when reading the file
            XCTFail("Could not parse data")
        }
        return resourceData
    }
}
