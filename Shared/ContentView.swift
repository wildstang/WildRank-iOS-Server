//
//  ContentView.swift
//  LiamRank
//
//  Created by Liam on 11/18/20.
//

import SwiftUI
import WebKit

struct ContentView: View {
    let webview = Webview(url: URL(string: "http://127.0.0.1:8080/index.html")!)
    var body: some View {
        webview
    }
}

struct Webview: UIViewControllerRepresentable {
    let webviewController = WebviewController()
    let url: URL
    
    func makeUIViewController(context: Context) -> WebviewController {
        return webviewController
    }
    
    func updateUIViewController(_ webviewController: WebviewController, context: Context) {
        //loadPage()
    }
    
    func loadPage() {
        print("[VIEW] Reloading web app")
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webviewController.webview.load(request)
    }
}

class WebviewController: UIViewController {
    lazy var webview: WKWebView = WKWebView()
    lazy var progressbar: UIProgressView = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webview.evaluateJavaScript("navigator.userAgent")
        self.webview.frame = self.view.frame
        self.view.addSubview(self.webview)
    }
}
