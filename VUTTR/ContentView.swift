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
        
        VStack(alignment: .leading) {
            Text("VUTTR")
                .padding([.leading, .top])
                .padding(.bottom)
                .font(.system(size: 40, weight: .medium, design: .serif))
            SearchBar(text: $searchText)
            ListView(tools: tools)
                .padding(.top, 5)
        }
        


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tools: .init())
    }
}


