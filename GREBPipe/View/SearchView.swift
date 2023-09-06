import AppKit
import SwiftUI

import KeyboardShortcuts

extension NSImage {
	func resize(to newSize: NSSize) -> NSImage {
		let newImage = NSImage(size: newSize)
		newImage.lockFocus()
		self.draw(in: NSRect(origin: .zero, size: newSize), from: .zero, operation: .copy, fraction: 1.0)
		newImage.unlockFocus()
		return newImage
	}
}
struct FloatingPanel: View {
	@State private var searchText: String = "type command"
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.fill(Color(NSColor.main.cgColor))
			
			HStack(spacing: 20) {
				Image("search_icon")
					.resizable()
					.frame(width: 40, height: 40)
				
				TextField("", text: $searchText)
					.font(.custom("JetBrainsMonoNL-Bold", size: 24))
					.foregroundColor(Color(NSColor.secondary))
					.textFieldStyle(.plain)
			}
			.padding(10)
		}
		.frame(width: 700, height: 70)
		.onAppear {
			NSApplication.shared.keyWindow?.makeFirstResponder(nil)
		}
		Form {
					KeyboardShortcuts.Recorder("Toggle Unicorn Mode:", name: .toggleUnicornMode)
				}
		
	}
}
final class Panel: NSPanel {
	var panelContent: FloatingPanel!
	
	init(contentRect: NSRect, backing: NSWindow.BackingStoreType, defer flag: Bool) {
		super.init(contentRect: contentRect, styleMask: [.nonactivatingPanel, .titled, .fullSizeContentView], backing: backing, defer: flag)
		
		// Your NSView
		let contentView = NSHostingView(rootView: FloatingPanel())
		contentView.frame = contentRect
		panelContent = FloatingPanel()
		// Make sure that the panel is in front of almost all other windows
		self.isFloatingPanel = false
		self.level = .floating
		
		// Allow the panel to appear in a fullscreen space
		self.collectionBehavior.insert(.fullScreenAuxiliary)
		
		// Don't delete panel state when it's closed.
		self.isReleasedWhenClosed = false
		
		// Make it transparent, the view inside will have to set the background.
		// This is necessary because otherwise, we will have some space for the titlebar on top of the height of the view itself which we don't want.
		self.isOpaque = false
		self.backgroundColor = .clear
		
		// Since we don't show a statusbar, this allows us to drag the window by its background instead of the titlebar.
		self.isMovableByWindowBackground = true
		self.titlebarAppearsTransparent = true
		self.contentView = NSHostingView(rootView: panelContent)
		self.isMovableByWindowBackground = true
		
		// Add keyboard shortcut (Command + period) for opening and closing the floating panel.
		KeyboardShortcuts.onKeyUp(for: .toggleUnicornMode) {
			//      				self.orderOut(nil)
			print("switch")
            if self.isVisible {
                self.orderOut(nil)
            } else {
                self.makeKeyAndOrderFront(nil)
            }
            
		}
		// The panel should close when it loses focus, i.e. when we click outside of it.
	}
}

#Preview{
	FloatingPanel(
		
	)
	
}



