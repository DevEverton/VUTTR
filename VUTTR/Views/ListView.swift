//
//  ListView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var tools: ToolList
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Spacer()
                    .padding(.bottom, 12)
                ForEach(tools.list) { tool in
                    ToolRow(
                            id: tool.id,
                            title: tool.title,
                            link: tool.link,
                            description: tool.description,
                            tags: tool.tags
                    )
                    .listRowBackground(Color("background"))
                    .padding([.top, .horizontal], 10)

                }
                
            }
            .navigationTitle("VUTTR")
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
