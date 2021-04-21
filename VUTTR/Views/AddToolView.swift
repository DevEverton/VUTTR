//
//  AddToolView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 19/03/21.
//

import SwiftUI

struct AddToolView: View {
    @State var toolName: String = ""
    @State var toolLink: String = "https://"
    @State var toolDescription: String = ""
    @State var toolTags: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State var messageOffset: CGFloat = -200
    @State var isEditing = false
    @State var index = 0
    
    var title: String
    var buttonLabel: String
    var tools: Tools    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
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
            
            //MARK: - Tool name
            
            TextEntry(placeholder: "tool", title: "Tool name", text: $toolName, charLimit: 20)
            
            //MARK: - Tool link

            TextEntry(placeholder: "link", title: "Tool link", text: $toolLink, charLimit: 30)
            
            VStack(alignment: .leading) {
                Text("Tool description")
                    .font(.system(size: 16, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding([.leading, .top])
                
                //MARK: - Tool description

                TextEditor(text: $toolDescription)
                    .cornerRadius(8)
                    .foregroundColor(Color("RowColor"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .padding(.horizontal)
                    .onChange(of: toolDescription) { value in
                        toolDescription = toolDescription.count > 100 ? String(toolDescription.dropLast()) : toolDescription
                    }
                    .autocapitalization(.none)

            }
            
            //MARK: - Tool tags

            TextEntry(placeholder: "tags", title: "Tags", text: $toolTags, charLimit: 30)
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
                    if isEditing {
                        tools.edit(withIndex: index, name: toolName, link: toolLink, description: toolDescription, tags: processTags(from: toolTags))

                    } else {
//                        tools.addTool(title: toolName, link: toolLink, description: toolDescription, tags: processTags(from: toolTags))
                        tools.postTool(title: toolName, link: toolLink, description: toolDescription, tags: processTags(from: toolTags))
                        tools.getTools()
                    }
                    
                    presentationMode.wrappedValue.dismiss()

                }){
                   Text(buttonLabel)
                    .font(.system(size: 18, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
                    .frame(width: 110, height: 30, alignment: .center)
                    .background(hasFieldsToFill() ? Color("green").opacity(0.2) : Color("green"))
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
        .onAppear {
            if buttonLabel == "Update" {
                isEditing = true
                index = tools.getIndexOf(title: toolName)
            }

        }

    }
    
    private func hasFieldsToFill() -> Bool {
        toolName.isEmpty || toolLink.isEmpty || toolDescription.isEmpty || toolTags.isEmpty
        
    }
    
    private func processTags(from tags: String) -> [String] {
        tags.split(separator: " ").map { String($0) }
    }
    
}

struct TextEntry: View {
    let placeholder: String
    let title: String
    @Binding var text: String
    let charLimit: Int
    
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
                .onChange(of: text) { value in
                    blockTyping(value)
                }
                .keyboardType(.default)
                .autocapitalization(.none)

        }
    }
    
    private func blockTyping(_ value: String) {
        text = value.count > charLimit ? String(text.dropLast()) : text
    }

}

struct AddToolView_Previews: PreviewProvider {
    static var previews: some View {
        AddToolView(title: "Add new tool", buttonLabel: "Add tool", tools: .init())
            .previewLayout(.sizeThatFits)
    }
}

struct TextEntry_Previews: PreviewProvider {
    static var previews: some View {
        TextEntry(placeholder: "test", title: "Test", text: .constant(""), charLimit: 0)
            .previewLayout(.sizeThatFits)
    }
}
