//
//  WebView.swift
//  VUTTR
//
//  Created by Everton Carneiro on 25/03/21.
//

import SwiftUI
import WebKit

//TODO: - Obter a porcentagem de progresso da pagina sendo carregada

struct WebView: UIViewRepresentable {
    let url: URL?

    static var progress = 0.0
    
    func makeUIView(context: Context) -> WKWebView {
        
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else { return }
        
        let request = URLRequest(url: myURL)
        uiView.load(request)
        WebView.progress = uiView.estimatedProgress
    }
}
