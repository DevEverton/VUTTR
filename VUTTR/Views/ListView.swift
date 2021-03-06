//
//  ListView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var tools: Tools
    
    @Binding var isShowingWebView: Bool
    @Binding var linkURL: URL
    @Binding var _title: String


    var body: some View {
        VStack {
            Group {
                if tools.list.isEmpty {
                    EmptyListView(isSearching: tools.isSearching, isLoading: tools.isLoading)
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        Spacer()
                        ForEach(tools.list) { tool in
                            ToolRow(id: tool.id! ,title: tool.title, link: tool.link!, description: tool.description, tags: tool.tags, isShowingWebView: $isShowingWebView, linkURL: $linkURL, _title: $_title, tools: tools)
                                .listRowBackground(Color("background"))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)

                        }
                        
                        Spacer()
                            .padding(.bottom, 10)
                    }
                }
            }


            
        }
        .background(Color("background"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .edgesIgnoringSafeArea(.bottom)

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(tools: .init(), isShowingWebView: .constant(false), linkURL: .constant(URL(string: "")!), _title: .constant(""))
    }
}
