//
//  ComicView.swift
//  MarvelFun
//
//  Created by Cody on 4/19/24.
//

import SwiftUI

struct ComicView: View {
    
    @Binding var selectedComic: Comic
    
    var body: some View {
        VStack(spacing: 0) {
            // Top navigation bar
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .padding([.trailing, .leading])
            .frame(maxWidth: .infinity, minHeight: 40.0)
            .background(Color.baseGray)
            
            HStack(alignment: .top) {
                ZStack(alignment: .top) {
                    AsyncImage(url: selectedComic.thumbnailURL(),
                               content: { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                            .blur(radius: 20)
                            .clipped()
                    }, placeholder: {
                        ProgressView()
                    })
                    
                    VStack {
                        HStack(alignment: .top) {
                            VStack {
                                AsyncImage(url: selectedComic.thumbnailURL(),
                                           content: { image in
                                    image.resizable().aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 200)
                                }, placeholder: {
                                    ProgressView()
                                })
                            }
                            VStack {
                                Button(action: {
                                    
                                }) {
                                    Text("READ NOW")
                                        .padding(.vertical, 20)
                                        .foregroundColor(.white)
                                        .frame(minWidth: 200)
                                }
                                .background(Color(red: 0.417,
                                                  green: 0.242,
                                                  blue: 0.69))
                                
                                // MARK AS READ Button
                                ActionButtonView(text: "MARK AS READ", iconName: "checkmark.circle.fill", action: {})
                                
                                // ADD TO LIBRARY Button
                                ActionButtonView(text: "ADD TO LIBRARY", iconName: "plus.circle.fill", action: {})
                                
                                // READ OFFLINE Button
                                ActionButtonView(text: "READ OFFLINE", iconName: "arrow.down.to.line.compact", action: {})
                            }
                            .frame(minWidth: 200)
                        }
                        .padding([.top, .bottom])
                        .padding([.leading, .trailing], 4)
                        VStack(alignment: .leading) {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    Text(selectedComic.title)
                                        .foregroundStyle(.white)
                                        .font(.title)
                                    Divider()
                                        .overlay(.white)
                                    Text(selectedComic.description ?? "")
                                        .foregroundStyle(.white)
                                    Spacer()
                                }
                            }
                            
                        }
                        .padding([.top, .bottom], 12)
                        .padding([.leading, .trailing], 8)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .background(Color.baseGray)
                    }
                    
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            // Bottom navigation bar
            HStack {
                
                Button(action: {
                    
                }) {
                    Group {
                        Spacer().frame(width: 0, height: 36.0)
                        
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(.leading, 4)
                            Text("PREVIOUS")
                                .padding(.vertical, 20)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .fontWeight(.bold)
                        .frame(maxWidth: 200, maxHeight: 40)
                    }
                }
                .background(Color.baseGray)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Group {
                        Spacer().frame(width: 0, height: 36.0)
                        
                        HStack {
                            Spacer()
                            Text("NEXT")
                                .padding(.vertical, 20)
                                .foregroundColor(.white)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .padding(.trailing, 4)
                        }
                        .fontWeight(.bold)
                        .frame(maxWidth: 200, maxHeight: 40)
                    }
                }
                .background(Color.baseGray)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 40.0)
            .background(Color.baseGray)
            
        }
    }
}

#Preview {
    ComicView(selectedComic: .constant(Comic(id: 44818, title: "Darth Vader (2017) #1", thumbnail: ImageData(path: "https://cdn.marvel.com/u/prod/marvel/i/mg/7/20/593063e9ae78d/clean", imageExtension: "jpg"), description: "The most fearsome villain of all time returns with an all-new series! When Anakin Skywalker fell, both to the pull of the dark side and to the blade of Obi-Wan Kenobi, he rose back up, more machine than man. Having lost everything that was once dear to him, the former chosen one must take his first steps into a darker world…as Darth Vader, Dark Lord of the Sith! ", upc: "75960608666500111")))
    
    //    ComicView(selectedComic: Comic(id: 44818, title: "Darth Vader (2017) #1", thumbnail: ImageData(path: "DV", imageExtension: "jpg"), description: "The most fearsome villain of all time returns with an all-new series! When Anakin Skywalker fell, both to the pull of the dark side and to the blade of Obi-Wan Kenobi, he rose back up, more machine than man. Having lost everything that was once dear to him, the former chosen one must take his first steps into a darker world…as Darth Vader, Dark Lord of the Sith!", upc: "75960608666500111"))
}