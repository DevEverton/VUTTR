//
//  ContentView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
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
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("VUTTR")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
