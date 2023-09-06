//
//  GREBPipeApp.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//

import SwiftUI
import AppKit


import KeyboardShortcuts




@main
struct GREBPipeApp: App {
		@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
            ContentView()
						.modelContainer(for: [Entity.self, Project.self] )
        }
			
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
	 lazy var panel: NSPanel = Panel(
				contentRect: NSRect(x: 0, y: 0, width: 700, height: 70),
				backing: .buffered,
				defer: false
		)


	 func applicationDidFinishLaunching(_ aNotification: Notification) {
				// panel.contentView = ...
				panel.makeKeyAndOrderFront(nil)
				panel.center()
	 }
}

extension KeyboardShortcuts.Name {
	static let toggleUnicornMode = Self("toggleUnicornMode", default: .init(.k, modifiers: [.command, .option]))
}

@MainActor
final class AppState: ObservableObject {
	init() {
		KeyboardShortcuts.onKeyUp(for: .toggleUnicornMode) {
			print("hello world")
		}
		
	}
}

