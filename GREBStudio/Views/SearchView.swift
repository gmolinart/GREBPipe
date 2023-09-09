import SwiftUI
import AppKit

#if os(macOS)
import AppKit
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


struct SearchView: View {
	var viewModel: FlowViewModel
	var parent: SearchWindow
	init( parent: SearchWindow) {
		self.parent = parent
		self.viewModel = parent.viewModel
		self.searchText = searchText
	}
	
	@State private var searchText: String = "type command"
	var body: some View {
		ZStack {
				
			
			RoundedRectangle(cornerRadius: 20)
				.fill(Color(NSColor.main.cgColor))
				.shadow(color: Color.black.opacity(1), radius: 0, x: -10, y: 10)
				.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
				
			
			HStack(spacing: 20) {
				Image("search_icon")
					.resizable()
					.frame(width: 40, height: 40)
					.padding(.leading)
				
				TextField("", text: $searchText, onCommit: {
					if searchText == "entities" {
						// Toggle entities window
						// Assuming there is a method toggleEntitiesWindow() to do this
						print("entities rock ")
						viewModel.generateNodesFromEntities()
					}
					else if searchText == "flow on" {
						// Toggle workflow window
						// Assuming there is a method toggleWorkflowWindow() to do this
						print("workflow rocks ")
						viewModel.flowOn()
					}
					else if searchText == "flow off" {
						// Toggle workflow window
						// Assuming there is a method toggleWorkflowWindow() to do this
						print("workflow rocks ")
						viewModel.flowOff()
						
					}


					print("hiding parent window")
					DispatchQueue.main.async {
						(self.parent as? NSPanel)?.orderOut(nil)
					}

					
					
					
				})
					.font(.custom("JetBrainsMonoNL-Bold", size: 24))
					.foregroundColor(Color(.background))
					.textFieldStyle(.plain)
			}
		}
		.frame(width: 700, height: 70)
		
		.padding(10)
		.onAppear {
			NSApplication.shared.keyWindow?.makeFirstResponder(nil)
		}
		Form {
			
					KeyboardShortcuts.Recorder("Toggle Search :", name: .toggleSearchBar)
				}
		
	}
}
final class SearchWindow: NSPanel {
	var panelContent: SearchView!
	var viewModel : FlowViewModel
	
	
	init(contentRect: NSRect, 
			 backing: NSWindow.BackingStoreType,
			 defer flag: Bool,
			 viewModel:FlowViewModel) {
		self.viewModel = viewModel
		super.init(contentRect: contentRect, styleMask: [.nonactivatingPanel,.borderless, .titled, .fullSizeContentView], backing: backing, defer: flag)
		
		let viewModel = viewModel
//		contentView.frame = contentRect
		panelContent = SearchView(parent: self)
		// Make sure that the panel is in front of almost all other windows
		self.isFloatingPanel = false
		self.level = .floating
		
		// Allow the panel to appear in a fullscreen space
		self.collectionBehavior.insert(.fullScreenAuxiliary)
		
		
		self.isOpaque = false
		self.backgroundColor = .clear
		
		self.titlebarAppearsTransparent = true
		self.contentView = NSHostingView(rootView: panelContent)
		self.isMovableByWindowBackground = true
		
//		 Add keyboard shortcut (Command + period) for opening and closing the floating panel.
	KeyboardShortcuts.onKeyUp(for: .toggleSearchBar) {
    if self.isVisible {
        self.orderOut(nil)
    } else {
        self.makeKeyAndOrderFront(nil)
    }
}
		
			
			
			
		
		



		panelContent = SearchView(parent: self)
		// Make sure that the panel is in front of almost all other windows
		self.isFloatingPanel = false
		self.level = .floating
		self.viewModel = viewModel
		
		// Allow the panel to appear in a fullscreen space
		self.collectionBehavior.insert(.fullScreenAuxiliary)
		
		self.isOpaque = false
		self.backgroundColor = .clear
		// Add rescaling controls
		self.collectionBehavior.insert(.fullScreenPrimary)
		self.collectionBehavior.insert(.managed)
		self.collectionBehavior.insert(.transient)
		
		
		// Since we don't show a statusbar, this allows us to drag the window by its background instead of the titlebar.
		self.contentView = NSHostingView(rootView: panelContent)
		self.isMovableByWindowBackground = true // Change this line
		
	}
}



#endif

//#Preview{
//	FloatingPanel()
//	
//}

//#Preview{
//	
//		let viewModel = FlowViewModel()
//		
//		FlowWindow(viewModel: viewModel)
//	
//}
