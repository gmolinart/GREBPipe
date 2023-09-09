import Flow
import SwiftUI
import SwiftData


	
	
			
			
struct FlowWindow: View {
	
	@ObservedObject var viewModel: FlowViewModel

	
	@State private var searchText: String = "type command"
	var body: some View {
			
		
		ZStack {
				
			FlowView(viewModel: viewModel)
               .onTapGesture {
                   NSApplication.shared.keyWindow?.isMovableByWindowBackground = false
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
				
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)

//					.position(x: screenSize?.width ?? -100, y: screenSize?.height ?? -100)
			
					
				
		}
		
		.padding(10)
		.onAppear {
			NSApplication.shared.keyWindow?.makeFirstResponder(nil)
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
			if viewModel.isFlowViewVisible {
				ZStack{
					
					RoundedRectangle(cornerRadius: 20)
						.fill(Color(NSColor.background.cgColor))
						.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
					
					
					
					VStack{
						
						NodeEditor(patch: $viewModel.patch, selection: $selection)
					}
					.shadow(radius: 0)
					
					.clipShape(RoundedRectangle(cornerRadius: 20))
					.padding(3)
					
				}
               .frame(minWidth: 200, minHeight: 100)
			   
			   
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
//					}
		}
	
}


//#Preview{
//	
//	let viewModel : FlowViewModel = SharedData.viewModel
//            
//	FlowView(viewModel: viewModel)
//			.modelContainer(previewEntitiesContainer)
//}

final class FlowPanel: NSPanel {
	var panelContent: FlowWindow!
	@ObservedObject var viewModel: FlowViewModel
	
	init(viewModel:FlowViewModel, contentRect: NSRect, backing: NSWindow.BackingStoreType, defer flag: Bool) {
		self.viewModel = viewModel
		super.init(contentRect: contentRect,
							 styleMask: [.resizable, .fullSizeContentView],
							 backing: backing,
							 defer: flag)
		
		self.isOpaque = false
		self.backgroundColor = .clear
		
//

//		self.titlebarAppearsTransparent = true
//		self.contentView = NSHostingView(rootView: panelContent)
		self.isMovableByWindowBackground = true

		
	}
	
	
}


