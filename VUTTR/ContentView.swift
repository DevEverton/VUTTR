//
//  ContentView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tools: ToolList
    @State var searchText = ""
    
    var body: some View {
        
        //TODO: - Make add Button
        
        ZStack {
            VStack(alignment: .leading) {
                Text("VUTTR")
                    .padding([.leading, .top])
                    .padding(.bottom)
                    .font(.system(size: 40, weight: .medium, design: .serif))
                SearchBar(text: $searchText)
                    .shadow(color: Color.black.opacity(0.8), radius: 3, x: 3, y: 3)
                ListView(tools: tools)
                    .padding(.top, 5)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }){
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 55, weight: .regular))
                            .foregroundColor(Color("yellow"))
                            .shadow(color: Color.black.opacity(0.8), radius: 3, x: 3, y: 3)
                    }
                }
                .padding([.bottom, .trailing], 5)
            }
        }
        


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tools: .init())
    }
}


