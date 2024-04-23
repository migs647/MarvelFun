//
//  UITestingNetworkHandler.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import Foundation


/// Setup class to be able to inject mocks for URLs. The main case right now is only for the main comic.
/// Must call register in order to overwrite the default URLProtocol class.
public final class UITestingNetworkHandler {
    
    public static func register() {
        URLProtocol.registerClass(UITestingURLProcotol.self)
        
        UITestingURLProcotol.responseProvider = { request in
            guard let url = request.url else { fatalError() }
            switch (url.host, url.path) {
                    // https://gateway.marvel.com/v1/public/comics
                case ("gateway.marvel.com", "/v1/public/comics"):
                    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                    
                    // Read the mock data for Comics
                    if let data = ComicBooksInventoryMock.readJSONFile(forName: "ComicPayload", fileExtension: "json") {
                        return .success(UITestingURLProcotol.ResponseData(response: response, data: data))
                    } else {
                        return .failure("Could not read mock data")
                    }
                default:
                    print("Skipping url: \(String(describing: url.host))\(url.path)")
                    return .failure("Skipping url")
            }
        }
    }
}
