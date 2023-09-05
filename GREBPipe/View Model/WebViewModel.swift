//
//  WebViewModel.swift
//  GREBAsset
//
//  Created by Guillermo Molina on 5/9/23.
//

import Foundation
import UIKit
import WebKit
import SwiftUI

class WebViewModel: ObservableObject {
		let webView: WKWebView
		let url: URL
		
		init() {
				webView = WKWebView(frame: .zero)
				url = URL(string: "https://absorbing-slouch-628.notion.site/b3cc702c41b94b9e9e6d57c3b0ed098c?v=da31179fd1624824a3a233101b94b64f&pvs=4")!
				loadUrl()
		}
		
		func loadUrl() {
				webView.load(URLRequest(url: url))
		}
}
