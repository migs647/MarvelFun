//
//  Binding+Marvel.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import SwiftUI

/// Add the ability for Bindings to be hashable and equatable to pass wrapped values from loops.
extension Binding: Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        return lhs.wrappedValue == rhs.wrappedValue
    }
}

extension Binding: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        self.wrappedValue.hash(into: &hasher)
    }
}
