//
//  ContentView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var tools: Tools
    @State var isAddingTool = false
    @State var isShowingWebView: Bool = false
    @State var linkURL = URL(string: "https://www.google.com")!
    @State var _title = "Tool"

    @State var searchText = ""
    
    
    var body: some View {
        ZStack {
            EmptyView()
                .fullScreenCover(isPresented: $isShowingWebView) {
                    ToolWebView(title: $_title, url: $linkURL)
                }
            
            VStack(alignment: .leading) {
                Text("VUTTR")
                    .padding([.leading, .top])
                    .padding(.bottom)
                    .font(.system(size: 40, weight: .bold, design: .serif))

                SearchBar(searchText: $searchText, tools: tools)
                    .padding(.top)
                
                ListView(tools: tools, isShowingWebView: $isShowingWebView, linkURL: $linkURL, _title: $_title)
                    .padding(.top, 5)
                    .animation(.easeInOut(duration: 0.2))

            }
  
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isAddingTool.toggle()
                        searchText = ""
                    }){
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 55, weight: .regular))
                            .foregroundColor(Color("yellow"))
                            .shadow(color: Color.black.opacity(0.8), radius: 3, x: 3, y: 3)
                    }
                }
                .padding(.trailing, 5)
            }
            .sheet(isPresented: $isAddingTool, content: {
                AddToolView(title: "Add new tool", buttonLabel: "Add tool", tools: tools)
            })
            
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tools: .init())
    }
}


