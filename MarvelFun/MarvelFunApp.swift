//
//  MarvelFunApp.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import SwiftUI

@main
struct MarvelFunApp: App {
    var body: some Scene {
        WindowGroup {
            ComicBookListView(inventory: ComicBooksInventory())
            #if DEBUG
            // Note: This is only used for UITesting and adds the ability to
            // Mock out our responses so we aren't waiting for the Network
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
