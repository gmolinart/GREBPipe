//
//  GREBStudioApp.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 6/9/23.
//

import SwiftUI
import SwiftData

#if macOs
import AppKit
#endif

class SharedData {
	static let shared = SharedData()
	static let viewModel: FlowViewModel = FlowViewModel()
	
}



@main
struct GrebSudio: App {
	

	@State public var flowViewModel: FlowViewModel = SharedData.viewModel
	@StateObject public var searchViewModel: Search =  Search()
	@State public var search_is_visible : Bool = true
	
										
	@State private var frame: CGSize = CGSize(width: 300, height: 200)										
	var windows = NSApplication.shared.windows
	
	
	
	
	var body: some Scene {
		WindowGroup{
			EntityListView()
				.modelContainer(for: [GEntity.self, GProject.self] )
		}
		Window("Search View", id:"search"){
			SearchView(model:Search(), viewModel: FlowViewModel(), currentSelectionIndex: 0)
					.onAppear{
							if let screen = NSScreen.main {
								for window in NSApplication.shared.windows {
									window.standardWindowButton(.miniaturizeButton)?.isHidden = true
									window.standardWindowButton(.zoomButton)?.isHidden = true
									window.standardWindowButton(.closeButton)?.isHidden = true
									window.titleVisibility = .hidden
									window.titlebarAppearsTransparent = true
									window.backgroundColor = .clear
								}
							}
						}
					.frame(width: 800, height: CGFloat(searchViewModel.filteredOptions.count) * 150, alignment: .topLeading)
					.gesture(
                DragGesture()
									.onChanged { value in
										print(value)
										if let window = NSApplication.shared.mainWindow {
											let newOrigin = NSPoint(x: window.frame.origin.x + value.translation.width, y: window.frame.origin.y - value.translation.height)
											window.setFrameOrigin(newOrigin)
											searchViewModel.windowPosition = newOrigin
										}
									}
            )
					.onReceive(searchViewModel.$windowPosition) { newPosition in
//							// Update the window's position here
//							 This code will run whenever searchViewModel.windowPosition changes
//							 searchViewModel.windowPosition = newPosition
						
//							print(value.translation.width)
							print(newPosition)
							print(Search().windowPosition)
//							// Add code here to update the window's position
                }
		}
			.keyboardShortcut("1")
		Window("Flow View", id: "flow"){
			FlowView(viewModel: flowViewModel)
				.onAppear{
					for window in self.windows{
						window.standardWindowButton(.miniaturizeButton)?.isHidden = true
						window.standardWindowButton(.zoomButton)?.isHidden = true
						window.standardWindowButton(.closeButton)?.isHidden = true
						window.titleVisibility = .hidden
						window.titlebarAppearsTransparent = true
						window.backgroundColor = .clear
					}
				}
		}
			.keyboardShortcut("2")
		
		
	}
}

//@main
//struct GREBStudioApp: App {
//	//#if os(macOS)
//
//	//	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//	//#endif
//	@State public var viewModel: FlowViewModel = SharedData.viewModel
//	@State private var entitiesWindowVisibility : Bool = false
//
//	@State public var model: Search =  Search()
//
//
//	//	var isFlowViewVisible: Bool {
//	//			get { viewModel.isFlowViewVisible }
//	//			set { viewModel.isFlowViewVisible = newValue }
//	//		}
//
//	var body: some Scene {
//
//			FramelessWindow(withId: "search_window") {
//
//				SearchView(model:model, viewModel: viewModel)
//
//			}



//			.commands{
//				// for example
//				CommandGroup(replacing: .help) {
//					Button(action: {toggle_entities()}) {
//						Text("Open Entities")
//					}
//
//
//				}
//	}
//}

//			ProjectView()
//				.modelContainer(for: [GEntity.self, GProject.self] )

//			EntityListView()
//				.modelContainer(for: [GEntity.self, GProject.self] )
//			MenuBarExtra("GREB", image: "GREBIcon")  {
//				ScrollView {
//					FlowWindow(viewModel: viewModel)
//				}
//				ProjectView()
//					.modelContainer(for: [GEntity.self, GProject.self] )
//				EntityListView()
//				.modelContainer(for: [GEntity.self, GProject.self] )

//			}
//
//		}
////	}
//		func toggle_entities(){
//			entitiesWindowVisibility.toggle()
//		}
//
//}


//#if os(macOS)
//final class AppDelegate: NSObject, NSApplicationDelegate {
//	private var viewModel: FlowViewModel = SharedData.viewModel
//	private var  search: SearchWindow = SearchWindow(
//			contentRect: NSRect(x: 0, y: 0, width: 700, height: 70),
//			backing: .buffered,
//			defer: false,
//			viewModel:SharedData.viewModel)
//
//	private var flow: FlowPanel = FlowPanel(
//			viewModel: SharedData.viewModel,
//			contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
//			backing: .buffered,
//			defer: false
//		)
//
//	func applicationDidFinishLaunching(_ aNotification: Notification) {
//
//
//		// first load the search pannel
//		search.makeKeyAndOrderFront(nil)
//		search.center()
//
//
//
//		let contentView = NSHostingView(rootView: FlowWindow(viewModel: SharedData.viewModel))
//
//		contentView.frame(forAlignmentRect: NSRect(x: 0, y: 0, width: 500, height: 500))
//
//		flow.contentView = contentView
//		flow.makeKeyAndOrderFront(nil)
//		flow.center()
//		let screen = NSScreen.main
//		let screenSize = screen?.frame.size
//		let flowSize = flow.frame.size
//		let horizontalCenter = (screenSize!.width - flowSize.width) / 2
//		flow.setFrameOrigin(NSPoint(x: horizontalCenter, y: flow.frame.origin.y))
//
//
//		// Toggle visibility of the window using SharedData.viewModel.isFlowVisible
//		SharedData.viewModel.isFlowViewVisible = !SharedData.viewModel.isFlowViewVisible
//
//    }
//
//}
//
//
//
//
//
//@MainActor
//final class AppState: ObservableObject {
//
//	@Published var isEntitiesWindowVisible: Bool = false
//
//	func toggleEntitiesWindow() {
//		isEntitiesWindowVisible.toggle()
//	}
//
//}
//

//#if os(macOS)
//extension KeyboardShortcuts.Name {
//	static let toggleSearchBar = Self("toggleUnicornMode", default: .init(.k, modifiers: [.command, .option]))
//	static let searchNextOption = Self("searchNextOption", default: .init(.n, modifiers: [.control]))
//}
//#endif
//
//
//
//#endif
//
//

