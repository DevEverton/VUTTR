//
//  EmptyListView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 25/03/21.
//

import SwiftUI

struct EmptyListView: View {
    let isSearching: Bool
    let isLoading: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20.0) {
                if isSearching {
                    Text("No results")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 25, weight: .black, design: .serif))
                    
                    Image(systemName: "xmark.bin.circle.fill")
                        .font(.system(size: 100, weight: .regular))
                    
                } else {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("red")))
                            .scaleEffect(1.5, anchor: .center)
                    } else {
                        Text("Click to add new tool")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25, weight: .black, design: .serif))

                        Image(systemName: "plus.circle")
                            .font(.system(size: 100, weight: .regular))
                    }
                }

            }
            .foregroundColor(Color("RowColor"))
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)


        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(isSearching: false, isLoading: true)
    }
}
