//
//  ListView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var tools: Tools

    var body: some View {
        VStack {
            Group {
                if tools.list.isEmpty {
                    EmptyView()
                } else {
                    ScrollView(showsIndicators: false) {
                        Spacer()
                        ForEach(tools.list) { tool in
                            ToolRow(
                                    title: tool.title,
                                    link: tool.link,
                                    description: tool.description,
                                    tags: tool.tags,
                                    tools: tools
                            )
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
        ListView(tools: .init())
    }
}
