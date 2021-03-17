//
//  SearchBar.swift
//  VUTTR
//
//  Created by Everton Carneiro on 11/03/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("only tags", text: $text)
                .padding(8)
                .background(Color("TagColor"))
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .animation(.spring())
                .font(.system(size: 16, weight: .regular, design: .serif))

 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Image(systemName: "x.circle").font(.system(size: 26, weight: .regular))
                        .foregroundColor(Color("red"))

                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }

        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            
    }
}