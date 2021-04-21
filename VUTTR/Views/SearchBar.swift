//
//  SearchBar.swift
//  VUTTR
//
//  Created by Everton Carneiro on 11/03/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing = false
    
    @ObservedObject var tools: Tools
     
    var body: some View {
        HStack {
            TextField("insert tool or tag #", text: $searchText)
                .padding(8)
                .background(Color("gray"))
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .animation(.spring())
                .font(.system(size: 16, weight: .regular, design: .serif))
                .onChange(of: searchText, perform: { value in
                    if searchText.count > 20 {
                        searchText = String(searchText.dropLast())
                    }
                    tools.search(value)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
//                        hideKeyboard()
//                    }
                })
                .autocapitalization(.none)

            if isEditing {
                Button(action: {
                    self.searchText = ""
                    self.isEditing = false
                    hideKeyboard()
 
                }) {
                    Image(systemName: "x.circle.fill").font(.system(size: 26, weight: .regular))
                        .foregroundColor(Color("red"))

                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
                
            }

        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), tools: .init())
            .previewLayout(.sizeThatFits)
            .padding(10)
            
    }
}
