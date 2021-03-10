//
//  ToolRow.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ToolRow: View {
    let id: Int
    let title: String
    let link: String
    let description: String
    let tags: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(Color.white)

            Text(description)
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .foregroundColor(Color.white)

            
            Text(getTags(from: tags))
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Color("TagColor"))


        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color("RowColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.8), radius: 3, x: 3, y: 3)
    }
    
    func getTags(from array: [String]) -> String {
          array
            .map {"#" + $0 + " "}
            .reduce("", {$0 + $1})
    }
}

struct ToolRow_Previews: PreviewProvider {
    static var previews: some View {
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
