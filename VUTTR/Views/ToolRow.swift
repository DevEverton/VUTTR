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
    
    @State var isShowingAlert = false
    
    @Binding var isShowingWebView: Bool
    @Binding var linkURL: URL
    @Binding var _title: String
    
    @ObservedObject var tools: Tools
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .medium, design: .serif))
                    .foregroundColor(Color.white)
                Spacer()
                HStack(spacing: 10.0) {
                    //MARK: - Link button
                    
                    Button(action: {
                        linkURL = URL(string: link)!
                        _title = title
                        isShowingWebView.toggle()

                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//
//                        }
                    }) {
                        Image(systemName: "link").font(.system(size: 20, weight: .regular))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.blue)
                    }
                    
                    //MARK: - Delete button
                    Button(action: {
                        isShowingAlert.toggle()
                    }) {
                        Image(systemName: "x.circle")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(Color("red"))
                    }
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("Remove tool"), message: Text("Are you sure do you want to remove \(title)?"),
                              primaryButton: .cancel(),
                              secondaryButton: .destructive(Text("Yes, remove")) {
                                let index = tools.getIndexOfTool(named: title)
                                tools.deleteTool(at: index)
                              })
                    }
 
                }
                .padding(.trailing, 12)
                
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
    
    
    private func getTags(from array: [String]) -> String {
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
                ], isShowingWebView: .constant(false), linkURL: .constant(URL(string: "")!), _title: .constant(""), tools: .init()
        )
        .previewLayout(.sizeThatFits)
        .padding(10)

    }
}
