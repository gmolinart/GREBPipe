//
//  GREBStudioApp.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 6/9/23.
//

import SwiftUI
import SwiftData
import KeyboardShortcuts


@main
struct GREBStudioApp: App {
#if os(macOS)
	
	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
#endif
	
	private var entitiesWindowVisibility  :Bool = false
	
	
	//	var isFlowViewVisible: Bool {
	//			get { viewModel.isFlowViewVisible }
	//			set { viewModel.isFlowViewVisible = newValue }
	//		}
	
	var body: some Scene {
			//
			let viewModel : FlowViewModel = SharedData.viewModel
			
			MenuBarExtra("GREB", image: "GREBIcon")  {
				ScrollView {
				FlowWindow(viewModel: viewModel)
					}
				
//				ProjectView()
//					.modelContainer(for: [GEntity.self, GProject.self] )
//				EntityListView()
//				.modelContainer(for: [GEntity.self, GProject.self] )
				
			}
				
				
									
			
//			ProjectView()
//				.modelContainer(for: [GEntity.self, GProject.self] )
			
//			EntityListView()
//				.modelContainer(for: [GEntity.self, GProject.self] )
			
			
		
		}
		
}


#if os(macOS)
final class AppDelegate: NSObject, NSApplicationDelegate {
	private var viewModel: FlowViewModel = SharedData.viewModel
	private var  search: SearchWindow = SearchWindow(
			contentRect: NSRect(x: 0, y: 0, width: 700, height: 70),
			backing: .buffered,
			defer: false,
			viewModel:SharedData.viewModel)

	private var flow: FlowPanel = FlowPanel(
			viewModel: SharedData.viewModel,
			contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
			backing: .buffered,
			defer: false
		)
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {


		// first load the search pannel
		search.makeKeyAndOrderFront(nil)
		search.center()
		
		
		
		let contentView = NSHostingView(rootView: FlowWindow(viewModel: SharedData.viewModel))
		
		contentView.frame(forAlignmentRect: NSRect(x: 0, y: 0, width: 500, height: 500))
		
		flow.contentView = contentView
		flow.makeKeyAndOrderFront(nil)
		flow.center()
		let screen = NSScreen.main
		let screenSize = screen?.frame.size
		let flowSize = flow.frame.size
		let horizontalCenter = (screenSize!.width - flowSize.width) / 2
		flow.setFrameOrigin(NSPoint(x: horizontalCenter, y: flow.frame.origin.y))
		

		// Toggle visibility of the window using SharedData.viewModel.isFlowVisible
		SharedData.viewModel.isFlowViewVisible = !SharedData.viewModel.isFlowViewVisible
	
    }
		
}
		
		
		
		

@MainActor
final class AppState: ObservableObject {
	
	@Published var isEntitiesWindowVisible: Bool = false
	
	func toggleEntitiesWindow() {
		isEntitiesWindowVisible.toggle()
	}
}

extension KeyboardShortcuts.Name {
	static let toggleSearchBar = Self("toggleUnicornMode", default: .init(.k, modifiers: [.command, .option]))
	static let searchNextOption = Self("searchNextOption", default: .init(.n, modifiers: [.control]))
}



#endif


class SharedData {
	static let shared = SharedData()
	static let viewModel: FlowViewModel = FlowViewModel()
	
}
