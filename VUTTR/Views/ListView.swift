//
//  ListView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Spacer()
                    .padding(.bottom, 12)
                ForEach(0..<10) { _ in
                    ToolRow(id: 1,
                            title: "Notion",
                            link: "https://notion.so",
                            description: "All in one tool to organize teams and ideas. Write, plan, collaborate, and get organized. ",
                            tags: [
                                "organization",
                                "planning",
                                "collaboration",
                                "writing",
                                "calendar"
                            ]
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
        ListView()
    }
}
