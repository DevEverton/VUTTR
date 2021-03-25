//
//  ToolWebView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 25/03/21.
//

import SwiftUI

struct ToolWebView: View {
    let title: String
    @Binding var url: URL
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .serif))
            WebView(url: url)
        }
    }
}

struct ToolWebView_Previews: PreviewProvider {
    static var previews: some View {
        ToolWebView(title: "Title", url: .constant(URL(string: "http://www.google.com")!))
    }
}
