//
//  MarvelFunApp.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import SwiftUI

@main
struct MarvelFunApp: App {
    var body: some Scene {
        WindowGroup {
            ComicBookListView(inventory: ComicBooksInventory())
            #if DEBUG
                .onAppear(perform: {
                    guard CommandLine.arguments.contains("-uitestingmock") else {
                        return
                    }
                    UITestingNetworkHandler.register()
                })
            #endif
        }
    }
}
