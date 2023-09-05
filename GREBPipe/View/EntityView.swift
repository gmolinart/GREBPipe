import SwiftUI
import OSLog

struct EntityView: View {
		@StateObject var viewModel = EntityListViewModel()

		var body: some View {
				NavigationView {
						VStack {
								List {
										ForEach(viewModel.filteredEntities) { entity in
												NavigationLink(destination: DetailView(entity: entity)) {
														HStack {
																Image(systemName: entity.icon)
																Text(entity.name)
														}
												}
												.onTapGesture {
														Logger().info("Tapped on \(entity.name)")
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
				}
		}
}

struct EntityView_Previews: PreviewProvider {
		static var previews: some View {
				EntityView()
		}
}
