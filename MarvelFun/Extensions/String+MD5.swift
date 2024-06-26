//
//  String+MD5.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import Foundation
import CryptoKit

/// Add the ability to error simple messages by throwing a string
extension String: Error { }

/// Adds convenience to Crypto functions
extension String {
    // Note: Found on developer.apple.com, may be worth unit testing in the future
    var MD5: String {
        get throws {
            guard let hashData = self.data(using: .utf8) else {
                throw "Could not parse the string"
            }
            let computed = Insecure.MD5.hash(data: hashData)
            return computed.map { String(format: "%02hhx", $0) }.joined()
        }
    }
}
