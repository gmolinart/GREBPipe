import SwiftUI
//import AppKit

//import AppKit
import Combine



struct ScaleWithWindow: ViewModifier {
	var count: Int

	
	func body(content: Content) -> some View {
		content
			.frame(width: 700, height:
							count == 0 ? 70 :
							(count == 1 ? 115 :
								(count == 2 ? 165 :
									(count == 3 ? 200 :
										(count == 4 ? 290 :
											(count == 5 ? 300 :
												(count == 6 ? 330 :
													(count == 7 ? 370 :
														400))))))), alignment: .topLeading)
		
	}
}

extension View {
	func scaleWithWindow(count: Int) -> some View {
		self.modifier(ScaleWithWindow(count: count))
	}
}


//extension NSImage {
//	func resize(to newSize: NSSize) -> NSImage {
//		let newImage = NSImage(size: newSize)
//		newImage.lockFocus()
//		self.draw(in: NSRect(origin: .zero, size: newSize), from: .zero, operation: .copy, fraction: 1.0)
//		newImage.unlockFocus()
//		return newImage
//	}
//}

class Search: ObservableObject {
	
	
	@State private var window: NSWindow?	
	
	@Published public var windowPosition = CGPoint(x: 0, y: 0)
	@Published public var text: String = ""
	@Published public var typeahead: String = ""
	
	public var index : Int = 0
	
	public var filteredOptions: [String] {
		options.filter { $0.contains(text) }
	}
	
	@Published public var options: [String] = ["entity",
																						 "flow on",
																						 "flow off",
																						 "create project",
																						 "create entity",
																						 "create shot",
																						 "go in",
																						 "go out",
																						 "add input",
																						 "add output",
																						 "settings"]
	
	
	public func is_match(option:String) -> Bool {
		return option != typeahead
	}
	
	init() {
		
	}
	public func move_down(){
		print("addding")
		index += 1
		let filteredItems = self.filteredOptions
		if self.index < filteredItems.count {
			self.typeahead = filteredItems[self.index]
		} else {
			self.typeahead = ""
			self.index = 0
		}
	}
	
	public func execute(searchText:String) {
		
		var viewModel = FlowViewModel()
		let searchView = SearchView(model: Search(), viewModel: viewModel, currentSelectionIndex: 0)
		
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
	}
	
}

struct SearchView: View {
	
	var model : Search
	var viewModel: FlowViewModel
	@State var options: [String] = []
	@State public var searchText: String = ""
	@State public var count: Int = 0
	@State public var currentSelectionIndex: Int
//	public var filteredOptions: [String] {
//		options.filter { $0.contains(searchText) }
//	}
//	@State public var currentSelectedAutoSelection: String = ""
//	@State public var selectedIndex: Int = 0 {
//		didSet {
//			print("selectedIndex didSet to \(selectedIndex)")
//		}
//	}
	
	
//	// Focus state
//	public enum Field: Int, Hashable {
//		case name, location, date, addAttendee
//	}

//	@FocusState public var focusedField: Field?
	
	
	
//	init(model:Search , viewModel:FlowViewModel ) {
//		self.viewModel = viewModel
//		self.model = model
//		self.options = model.options
//		self.searchText = ""
//		self.count = model.filteredOptions.count
//	}
	
	
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20)
			.fill(Color.main)
				.shadow(color: Color.black.opacity(1), radius: 0, x: -10, y: 10)
				.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
				.scaleWithWindow(count: model.filteredOptions.count)
			VStack(spacing: 0) {
				HStack(spacing: 20) {
					Image("search_icon")
						.resizable(resizingMode: .stretch)
						.frame(width: 40, height: 40)
						.padding(10)
					//            .gesture(
					////                DragGesture()
					//                    .onChanged { value in
					//											model.windowPosition.x += value.translation.width
					//                        model.windowPosition.y += value.translation.height
					//                        // Here you should update the position of the window
					//                        // using the windowPosition variable
					//											print(value.translation.width)
					//                    }
					//            )
					if(!searchText.isEmpty) {
						
						Image(systemName: "pencil")
							.resizable()
							.frame(width: 30, height: 30)
							.padding(.leading,-10)
							.foregroundColor(.black)
					}
					
					
					
					ZStack(alignment: .leading) {
						if searchText.isEmpty {
							
							
							Text("Commands...")
								.foregroundColor(.black.opacity(0.5))
								.font(.custom("JetBrainsMonoNL-Bold", size: 24))
						}
						TextField("", text: $searchText,
											onCommit:{
							model.execute(searchText: searchText)
							self.searchText = ""
						}
						)
						.font(.custom("JetBrainsMonoNL-Bold", size: 24))
						.textFieldStyle(PlainTextFieldStyle())
								.onChange(of: searchText) { newValue in
										print( searchText)
										model.text = searchText
								}
						.foregroundColor(Color.black)
						//						.focused($focusedField, equals: .addAttendee)
						//						.onAppear {
						//							NSApplication.shared.keyWindow?.makeFirstResponder(nil)
						//						}
						.background(Color.clear)
						.scrollContentBackground(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
						.clipped(antialiased: true)
						
						
						
					}
					
					Button("submit"){
						print("hello world")
						
					}
					.foregroundStyle(.black)
					.keyboardShortcut(KeyEquivalent("n"), modifiers: .control)
					.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
					
				}
//					SuggestionsListView(options:["test","test2"], model : Search())
//				SuggestionView(option: "hello")
	

				SuggestionsListView(options: model.filteredOptions, model: Search())
				}
			.padding(0)
			.scaleWithWindow(count: model.filteredOptions.count)
						//					.background(Color(.accent))
				
		}
		.overlay(RoundedRectangle(cornerRadius: 20)
			.stroke(Color.black, lineWidth: 8))
		.animation(.interpolatingSpring)
		.padding(15)
		
	}
}

//
//final class SearchWindow: NSPanel {
//	var panelContent: SearchView!
//	var viewModel : FlowViewModel
//	var model: Search =  Search()
//	var index : Int = 0
//
//
//	init(contentRect: NSRect,
//			 backing: NSWindow.BackingStoreType,
//			 defer flag: Bool,
//			 viewModel:FlowViewModel) {
//		self.viewModel = viewModel
//		super.init(contentRect: contentRect, styleMask: [.nonactivatingPanel,.borderless, .titled, .fullSizeContentView], backing: backing, defer: flag)
//
//		// Make sure that the panel is in front of almost all other windows
////		self.isFloatingPanel = false
//		self.level = .floating
//
//		// Allow the panel to appear in a fullscreen space
//		self.collectionBehavior.insert(.fullScreenAuxiliary)
//
//		self.isOpaque = false
//		self.backgroundColor = .clear
//
//		self.titlebarAppearsTransparent = true
//		self.contentView = NSHostingView(rootView: panelContent)
//		self.isMovableByWindowBackground = true
//
//		// Add keyboard shortcut (Command + period) for opening and closing the floating panel.
//
//
//		panelContent = SearchView(model:model, viewModel: viewModel)
//
//
//
//		panelContent.onAppear {
//			self.panelContent.focusedField = .addAttendee
//					}
//
//
//		KeyboardShortcuts.onKeyUp(for: .searchNextOption) {
//
//			self.index += 1
//			// Protect against Thread 1: Fatal error: Index out of range
//			let filteredItems = self.model.filteredOptions
//			if self.index < (filteredItems.count + 1) {
//				self.model.typeahead = filteredItems[self.index-1]
//			} else {
//				self.model.typeahead = ""
//				self.index = 0
//			}
//
//
//
//
//
//			print("DBUG:::::::::::")
//			print("_________\(self.index)")
//			print("model \(self.model.filteredOptions)")
//			print("type ahead \(self.model.typeahead)")
//
//			print("text: \(self.panelContent.model.text)")
//			//    print("count: \(self.panelContent.$count)")
//			//    print("filteredOptions: \(self.panelContent.$filteredOptions)")
//
//		}
//
//
//		KeyboardShortcuts.onKeyUp(for: .toggleSearchBar) {
//			if self.isVisible {
//				self.orderOut(nil)
//			} else {
//				self.makeKeyAndOrderFront(nil)
//			}
//		}
//	}
//}



final class SearchWindow: View {
	var panelContent: SearchView!
	var viewModel : FlowViewModel
	var model: Search =  Search()
	var isVisible: Bool = true
	
	
		
	init(viewModel:FlowViewModel) {
		self.viewModel = viewModel
		self.panelContent = SearchView(model: model, viewModel: viewModel, currentSelectionIndex: 000)
	}

	var body: some View {
		SearchView(model:model, viewModel: viewModel, currentSelectionIndex: 0)
	}
}

struct SuggestionView: View {
	var option: String
	@ObservedObject var model : Search = Search()
	
	var body: some View {
		HStack(spacing: 0) {
			ZStack{
				RoundedRectangle(cornerRadius: 20)
					.fill(model.is_match(option: option) ? Color(.clear) : Color("accent"))
					.frame(width: 670, height: 55, alignment: .center)
					.padding(10)
					.scaleEffect(CGSize(width: 1.1, height: 1.0))
				//					.shadow(color: Color.black.opacity(1), radius: 0, x: -10, y: 10)
				
				HStack{
					Image(systemName: "")
						.resizable()
						.frame(width: 30, height: 30)
						.padding(.leading,13 )
						.padding(.trailing,8 )
						.foregroundColor(.black)
					
					Image(systemName: "fork.knife.circle.fill")
						.resizable()
						.frame(width: 30, height: 30)
						.padding(.leading,16 )
						.padding(.trailing,7 )
						.foregroundColor(.black)
					
					Text(option)
						.font(.custom("JetBrainsMonoNL-Bold", size: 24))
						.foregroundColor(Color.black)
						.frame(maxWidth: .infinity, alignment: .leading)
					
						.background(Color.clear)
						.scrollContentBackground(.hidden)
				}
			}
		}
		.padding(.all, -19.973)
		.scrollContentBackground(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
	}
}

struct SuggestionsListView: View {
	var options : [String] = Search().options
	var model : Search
	var body: some View {
		
		List{
			ForEach(options, id: \.self) { option in
				SuggestionView(option :option,model: model)
			}
			//				.background(Color(.main))
			//					.background(Color(.accent))
		}
		.listRowBackground(Color.main)
		.scrollContentBackground(.hidden)
		
		
	}
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = FlowViewModel()
		SearchView(model : Search(), viewModel: viewModel, currentSelectionIndex: 0)
	}
}

#endif

#Preview("suggestion") {
	SuggestionView(option: "pizza",
								 model : Search())
	
}

#Preview("suggestionList") {
	
	
	SuggestionsListView(options:Search().options, model : Search())
	
}

