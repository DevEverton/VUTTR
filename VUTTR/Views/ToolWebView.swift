//
//  ToolWebView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 25/03/21.
//

import SwiftUI

struct ToolWebView: View {
    @Binding var title: String
    @Binding var url: URL
    @State var statusBarIsHidden = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                Text(title)
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding([.top, .leading], 20)


                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Image(systemName: "x.circle.fill")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color("red"))
                }
                .padding([.top, .trailing], 20)


            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color("background"))
            

            //MARK: - Progress Bar
//
//            ProgressBar(value: CGFloat(0.2))
//                .frame(maxHeight: 5.0)

            //MARK: - WebView

            WebView(url: url)
            


            
        }
        .statusBar(hidden: statusBarIsHidden)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            statusBarIsHidden.toggle()
        }

    }
    
}

struct ToolWebView_Previews: PreviewProvider {
    static var previews: some View {
        ToolWebView(title: .constant("Title"), url: .constant(URL(string: "http://www.google.com")!))
    }
}
