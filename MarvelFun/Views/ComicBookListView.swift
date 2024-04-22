//
//  ComicBookListView.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import SwiftUI

struct ComicBookListView: View {
    
    // Used to gather the inventory of comic books
    let inventory: any Inventory
    
    // Current rendering state of existing comic books.
    // Note: Can potentially be used to manage the state of each book such as
    // marking as read or adding to the the library.
    @State private var comicBooks: [Comic] = []
    
    // Used to display the active comic selected.
    @State private var selectedComic: Comic = Comic(id: 0,
                                                    title: "",
                                                    thumbnail: ImageData(path: "", imageExtension: ""), 
                                                    description: "",
                                                    upc: "")
    
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
                    ForEach(comicBooks, id: \.self) { comic in
                        Button(action: {
                            selectedComic = comic
                            isDisplayingComic.toggle()
                        }) {
                            ComicRow(comic: comic)
                        }
                    }
                    .listRowBackground(Color.baseGray)
                    .font(.system(size: 18))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                }
                .sheet(isPresented: $isDisplayingComic) {
                    ComicView(selectedComic: selectedComic)
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
