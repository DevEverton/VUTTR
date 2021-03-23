//
//  ToolRow.swift
//  VUTTR
//
//  Created by Everton Carneiro on 10/03/21.
//

import SwiftUI

struct ToolRow: View {
//    let id: Int
    let title: String
    let link: String
    let description: String
    let tags: [String]
    @State private var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .medium, design: .serif))
                    .foregroundColor(Color.white)
                Spacer()
                Button(action: {
                    showingAlert.toggle()
                }) {
                    Image(systemName: "x.circle").font(.system(size: 18, weight: .regular))
                        .foregroundColor(Color("red"))
                }
                .padding(.trailing, 12)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Remove tool"), message: Text("Are you sure do you want to remove \(title)"),
                          primaryButton: .cancel(),
                          secondaryButton: .destructive(Text("Yes, remove")) {
                            print("Deleting...")
                          })
                }
                
            }

            Text(description)
                .font(.system(size: 16, weight: .regular, design: .serif))
                .foregroundColor(Color.white)
                .lineLimit(2)

            
            HStack {
                Image(systemName: "tag").font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color("TagColor"))

                Text(getTags(from: tags))
                    .font(.system(size: 14, weight: .bold, design: .serif))
                    .foregroundColor(Color("TagColor"))
            }


        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .vertical],12)
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
        ToolRow(
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
        .previewLayout(.sizeThatFits)
        .padding(10)

    }
}
