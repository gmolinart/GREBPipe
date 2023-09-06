import SwiftUI
import OSLog
import SwiftData

struct EntityView: View {
	@Environment(\.modelContext) private var modelContext
	@Query private var entities : [Entity]
	@State var viewModel = EntityListViewModel()
	
	@State private var isPopupShown: Bool = false
	@State private var userInput: String = ""
	
	var body: some View {
		
		NavigationView {
			
			VStack {
				Button("add"){
					print("adding ")
					isPopupShown.toggle()
					
				}
				List {
					ForEach(entities) { entity in
						NavigationLink(destination: DetailView(entity: entity)) {
							HStack {
								Image(systemName: entity.icon)
								Text(entity.name)
							}
							.contextMenu {
								Button(action: {
									modelContext.delete(entity)
								}) {
									Text("Delete")
									Image(systemName: "trash")
								}
							}
						}
					}
				}
				.searchable(text: $viewModel.searchText,
										suggestions: {
					ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
						Text(suggestion)
							.searchCompletion(suggestion)
					}
				})
				
			}
			.navigationTitle("Entities")
			.sheet(isPresented: $isPopupShown, onDismiss: {
				isPopupShown = false
				
			}, content:{
				InputPopupView(isShown: $isPopupShown, userInput: $userInput )
				
			}
			)
		}
	}
	
}
struct EntityView_Previews: PreviewProvider {
	static var previews: some View {
		EntityView()
			.modelContainer(for: [Entity.self, Project.self] )
	}
}
