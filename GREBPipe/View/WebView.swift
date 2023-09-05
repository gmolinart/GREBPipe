//
//  WebView.swift
//  GREBAsset
//
//  Created by Guillermo Molina on 5/9/23.
//


import Foundation
import UIKit
import WebKit
import SwiftUI


struct WebView: UIViewRepresentable {
		typealias UIViewType = WKWebView

		let webView: WKWebView

		func makeUIView(context: Context) -> WKWebView {
				return webView
		}

		func updateUIView(_ uiView: WKWebView, context: Context) { }
}
