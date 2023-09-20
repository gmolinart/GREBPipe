import Flow
import SwiftUI
import SwiftData


	
	
			
/// `FlowWindow` is a `View` that represents the main window of the Flow application.
///
/// It contains a `FlowView` and a logo image, both placed inside a `ZStack`.
///
/// The `FlowView` is bound to a `FlowViewModel` which is observed for changes.
///
/// The logo image is placed at the bottom trailing corner of the window.
///
/// The window becomes non-movable when tapped.
///
/// On appear, the window resigns its first responder status.
///
/// - TODO: Add keyboard shortcuts for better user interaction.
/// - TODO: Show the logo prominently for branding purposes.
/// - TODO: Make the window draggable from the top for better user experience.
/// - TODO: Add a close button for user convenience.
/// - TODO: Add a path bar for better navigation.

///
/// - Note: The `FlowWindow` does not currently support keyboard shortcuts.
///
/// - Author:
/// - Version: 1.0	
///
struct FlowWindow: View {
	
	@ObservedObject var viewModel: FlowViewModel

	
	@State private var searchText: String = "type command"
	var body: some View {
		ZStack {
				
			FlowView(viewModel: viewModel)
               .onTapGesture {
//                   NSApplication.shared.keyWindow?.isMovableByWindowBackground = false
               }
			.modelContainer(previewEntitiesContainer)
			Group{

				HStack{
					Image("GREBLogo")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 70, height: 70,alignment: .bottomTrailing)
						.padding(.trailing, 38.0)
						.padding(.bottom, 20)
						
				}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
				
			}

//					.position(x: screenSize?.width ?? -100, y: screenSize?.height ?? -100)
			
					
				
		}
		
		.padding(10)
		.onAppear {
//			NSApplication.shared.keyWindow?.makeFirstResponder(nil)
		}
		}
//		form {
//					keyboardshortcuts.recorder("toggle search :", name: .togglesearchbar)
//				}
		
}


struct FlowView: View {
		
		@ObservedObject var viewModel: FlowViewModel
		@State var patch = Patch()
		@State var selection = Set<NodeIndex>()
		@Query private var entities: [GEntity]
		@Environment(\.modelContext) private var modelContext
		
		func deleteSelectedNode() {
					guard let selectedNodeIndex = selection.first else { return }
					patch.nodes.remove(at: selectedNodeIndex)
					selection.remove(selectedNodeIndex)
				}
		
		var body: some View {
				HStack{
					ZStack{
						
						RoundedRectangle(cornerRadius: 20)
							.fill(Color("cgColor"))
							.shadow(color: Color.black.opacity(1), radius: 0, x: -10, y: 10)
							.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
							.padding(10)
						
						
						VStack{
							
							NodeEditor(patch: $viewModel.patch, selection: $selection)
						}
						
						
						.clipShape(RoundedRectangle(cornerRadius: 20))
						.padding(10)
						
					}
					.padding(10)
				}
			   
			   
//							 .padding(10)
				
			}
//					VStack{
//						Button(action: {
//							self.viewModel.generateNodesFromEntities()
//						}) {
//							Text("Generate Nodes from Entities")
//						}
//						Button(action: {
//							self.deleteSelectedNode()
//						}) {
//							Text("Delete Selected Node")
//						}
}


//#Preview{
//	
//	let viewModel : FlowViewModel = SharedData.viewModel
//            
//	FlowView(viewModel: viewModel)
//			.modelContainer(previewEntitiesContainer)
//}

//final class FlowPanel: NSPanel {
//	var panelContent: FlowWindow!
//	@ObservedObject var viewModel: FlowViewModel
//	
//	init(viewModel:FlowViewModel, contentRect: NSRect, backing: NSWindow.BackingStoreType, defer flag: Bool) {
//		self.viewModel = viewModel
//		super.init(contentRect: contentRect,
//							 styleMask: [.resizable, .fullSizeContentView],
//							 backing: backing,
//							 defer: flag)
//		
//		self.isOpaque = false
//		self.backgroundColor = .clear
//		
////
//
////		self.titlebarAppearsTransparent = true
////		self.contentView = NSHostingView(rootView: panelContent)
//		NSEvent.addLocalMonitorForEvents(matching: .flagsChanged) {
//			if $0.modifierFlags.contains(.command) {
//				print("Command key is pressed")
//				self.isMovableByWindowBackground = true
//			}
//			else {
//				self.isMovableByWindowBackground = false
//			}
//			return $0
//		}
//		
//
//		
//	}
//	
//	
//}
//
//// #Preview {
//// //	view.generateNodesFromEntities()
////#Preview{
////	let previewViewModel: FlowViewModel = FlowViewModel()
////	FlowWindow(viewModel: previewViewModel)
////		.previewLayout(.fixed(width: 400, height: 300))
////		.padding()
////		.background(Color.white)
//////		.environment(\.colorScheme, .light)
////	
////}

// #Preview {
// //	view.generateNodesFromEntities()
//	
// 	let view: FlowViewModel = FlowViewModel()
//	 
// 	FlowView(viewModel: view)
// }
//
//Model

	

func test_mdl() -> Patch {
let generator = Node(name: "mdl", titleBarColor: Color.cyan, outputs: ["usd"])
let processor = Node(name: "rig", titleBarColor: Color.red, inputs: ["in"], outputs: ["out"])
let mixer = Node(name: "mixer", titleBarColor: Color.gray, inputs: ["in1", "in2"], outputs: ["out"])
let output = Node(name: "output", titleBarColor: Color.purple, inputs: ["in"])
let input = Node(name: "input", titleBarColor: Color.purple, outputs: ["usd"])

let nodes = [input, generator, processor, mixer, output]

let wires = Set([Wire(from: OutputID(0, 0), to: InputID(1, 0)),
									 Wire(from: OutputID(1, 0), to: InputID(4, 0))])
//									 Wire(from: OutputID(4, 0), to: InputID(5, 0))])

var  patch = Patch(nodes: nodes, wires: wires)
patch.recursiveLayout(nodeIndex: 4, at: CGPoint(x: 800, y: 50))
return patch
}

struct TestView: View {

		@State var selection = Set<NodeIndex>()
		@State var data : Patch
	
	init(){
		self.data = test_mdl()
	}

	var body: some View {
		ZStack{
			NodeEditor(patch: $data,  selection: $selection)
			
			Group{
				
				HStack{
					Image("GREBLogo")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 70, height: 70,alignment: .bottomTrailing)
						.padding(.trailing, 38.0)
						.padding(.bottom, 20)
					
				}
				
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
		}
	}
	
	
}


#Preview {
	
	TestView()
	
}
