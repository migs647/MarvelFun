//
//  ActionButtonView.swift
//  MarvelFun
//
//  Created by Cody on 4/21/24.
//

import SwiftUI

struct ActionButtonView: View {
    
    let text: String
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Group {
                Spacer().frame(width: 0, height: 36.0)
                
                HStack {
                    Image(systemName: iconName)
                        .foregroundColor(.white)
                        .padding(.leading, 4)
                    Divider()
                        .overlay(.white)
                        .padding([.top, .bottom], 10)
                    Text(text)
                        .padding(.vertical, 20)
                        .foregroundColor(.white)
                    Spacer()
                }.frame(maxWidth: 200, maxHeight: 40)
            }
        }
        .background(Color.baseGray)
    }
}

#Preview {
    ActionButtonView(text: "ACTION BUTTON", 
                     iconName: "plus.circle.fill",
                     action: {})
}
