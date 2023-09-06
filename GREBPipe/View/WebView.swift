//
//  WebView.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//


import Foundation
import WebKit
import SwiftUI


#if os(iOS)
struct WebView: UIViewRepresentable {
		typealias UIViewType = WKWebView

		let webView: WKWebView

		func makeUIView(context: Context) -> WKWebView {
				return webView
		}

		func updateUIView(_ uiView: WKWebView, context: Context) { }
}
#elseif os(macOS)
import AppKit
struct WebView: NSViewRepresentable {
		typealias NSViewType = WKWebView

		let webView: WKWebView

		func makeNSView(context: Context) -> WKWebView {
				return webView
		}

		func updateNSView(_ nsView: WKWebView, context: Context) { }
}
#endif


