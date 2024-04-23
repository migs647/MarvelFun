//
//  Constants.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import Foundation


/// Constants used throughout the app.
/// Note: Used a caseless enum so Constants can not be instantiated.
/// Replace the apiKey and privateApiKey from https://developer.marvel.com
enum Constants {
    static let apiKey = "<INSERT_YOUR_API_KEY>"
    static let privateApiKey = "<INSERT_YOUR_PRIVATE_API_KEY>"
    static let apiEndpointUrl = "https://gateway.marvel.com/v1/public/comics"
}
