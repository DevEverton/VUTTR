//
//  AddToolView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 19/03/21.
//

import SwiftUI

struct AddToolView: View {
    @State var toolName: String
    @State var toolLink: String
    @State var toolDescription: String
    @State var toolTags: String
    @Environment(\.presentationMode) var presentationMode
    
    @State var messageOffset: CGFloat = -200
        
    var tools: Tools    
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Tool")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .serif))


                Spacer()
                Button(action: {
                    self.toolName = ""
                    hideKeyboard()
                    presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Image(systemName: "x.circle.fill").font(.system(size: 26, weight: .regular))
                        .foregroundColor(Color("red"))
                    
                }
                .shadow(color: Color.black.opacity(0.8), radius: 3, x: 3, y: 3)
                
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            TextEntry(placeholder: "tool", title: "Tool name", text: $toolName)
            
            TextEntry(placeholder: "link", title: "Tool link", text: $toolLink)
            
            VStack(alignment: .leading) {
                Text("Tool description")
                    .font(.system(size: 16, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding([.leading, .top])
                TextEditor(text: $toolDescription)
                    .cornerRadius(8)
                    .foregroundColor(Color("RowColor"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .padding(.horizontal)
            }
            
            TextEntry(placeholder: "tags", title: "Tags", text: $toolTags)
            Spacer()
            HStack {
                Text("*All fields must be filled")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .padding(.leading)
                    .foregroundColor(Color("red"))
                    .offset(x: hasFieldsToFill() ? messageOffset : -200)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1))
                    
                Spacer()
                Button(action: {
                    tools.addTool(title: toolName, link: toolLink, description: toolDescription, tags: [])
                    presentationMode.wrappedValue.dismiss()

                }){
                   Text("Add tool")
                    .font(.system(size: 18, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
                    .frame(width: 110, height: 30, alignment: .center)
                    .background(hasFieldsToFill() ? Color("gray") : Color("green"))
                    .cornerRadius(8)
                    
                }
                .shadow(color: Color.black.opacity(0.8), radius: 3, x: 3, y: 3)
                .padding(.trailing)
                .disabled(hasFieldsToFill())
                .onTapGesture {
                    messageOffset = hasFieldsToFill() ? 0 : -200
                }

                
            }
            .padding(.bottom, 50)

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
    
    private func hasFieldsToFill() -> Bool {
        toolName.isEmpty || toolLink.isEmpty || toolDescription.isEmpty || toolTags.isEmpty
        
    }
    
}

struct TextEntry: View {
    let placeholder: String
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .serif))
                .foregroundColor(.white)
                .padding([.leading, .top])


            TextField(placeholder, text: $text)
                .padding(8)
                .padding(.horizontal, 10)
                .foregroundColor(Color("RowColor"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct AddToolView_Previews: PreviewProvider {
    static var previews: some View {
        AddToolView(toolName: "", toolLink: "", toolDescription: "", toolTags: "", tools: .init())
            .previewLayout(.sizeThatFits)
    }
}

struct TextEntry_Previews: PreviewProvider {
    static var previews: some View {
        TextEntry(placeholder: "test", title: "Test", text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
