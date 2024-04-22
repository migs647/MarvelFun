//
//  ComicBookListView.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import SwiftUI

struct ComicBookListView: View {
    
    let inventory: any Inventory
    
    @State private var comicBooks: [Comic] = []
    
    @State private var selectedComic: Comic = Comic(id: 0, title: "", thumbnail: ImageData(path: "", imageExtension: ""), description: "", upc: "")
    
    @State private var lastErrorMessage = "" {
        didSet {
            isDisplayingError = true
        }
    }
    @State private var isDisplayingError = false
    @State var isDisplayingComic = false
    
    var body: some View {
        NavigationStack {
            VStack {

                // The list of Comics.
                List {
                    if comicBooks.isEmpty  {
                        ProgressView().padding()
                            .tint(.white)
                            .background(Color.baseGray)
                            .foregroundColor(.white)
                            .listRowBackground(Color.baseGray)
                            .controlSize(.large)
                    }
                    ForEach($comicBooks, id: \.self) { comic in
                        NavigationLink {
                            ComicView(selectedComic: comic)
                        } label: {
                            ComicRow(comic: comic.wrappedValue)
                        }
                    }
                    .listRowBackground(Color.baseGray)
                    .font(.system(size: 18))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                }
                .listStyle(.plain)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Comics")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            
            .alert("Error", isPresented: $isDisplayingError, actions: {
                Button("Close", role: .cancel) { }
            }, message: {
                Text(lastErrorMessage)
            })
            .background(Color.baseGray)
        }
        .task {
            guard comicBooks.isEmpty else { return }
            do {
                comicBooks = try await inventory.currentComics()
            } catch {
                lastErrorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    ComicBookListView(inventory: ComicBooksInventoryMock())
}
