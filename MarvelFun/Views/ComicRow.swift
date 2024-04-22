//
//  ComicRow.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import SwiftUI

import SwiftUI

struct ComicRow: View {
    let comic: Comic
    
    var body: some View {
        Button(action: {
            //      if !selected.insert(symbolName).inserted {
            //        selected.remove(symbolName)
            //      }
        }, label: {
            HStack {
                HStack {
//                    if selected.contains(symbolName) {
//                        Image(systemName: "checkmark")
//                    }
                }
                .frame(width: 20)
                AsyncImage(url: comic.thumbnailURL(),
                           content: { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 40, minHeight: 80)
                }, placeholder: {
                    ProgressView()
                })
                
                Text(comic.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()
            }
        })
        .background(Color.baseGray)
        .frame(minHeight: 50)
        
    }
}

#Preview {
    ComicRow(comic: Comic(id: 44818, title: "Darth Vader (2017) #1", thumbnail: ImageData(path: "https://cdn.marvel.com/u/prod/marvel/i/mg/7/20/593063e9ae78d/clean", imageExtension: "jpg"), description: "The most fearsome villain of all time returns with an all-new series! When Anakin Skywalker fell, both to the pull of the dark side and to the blade of Obi-Wan Kenobi, he rose back up, more machine than man. Having lost everything that was once dear to him, the former chosen one must take his first steps into a darker world…as Darth Vader, Dark Lord of the Sith! ", upc: "75960608666500111"))
}
