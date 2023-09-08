/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view modifier for showing sample data in previews.
*/

import SwiftData
import SwiftUI
import Foundation


@MainActor
let previewContainer: ModelContainer = {
			let config = ModelConfiguration(isStoredInMemoryOnly: true)
			
			let container = try! ModelContainer(for: GProject.self,
																					configurations: config)
			let localContext = ModelContext(container)
				 
			
			for project in SampleProject.contents {
						container.mainContext.insert(project)
				for entity in project.entities{
					container.mainContext.insert(entity)

					if case entity.tasks = entity.tasks {
					for task in entity.tasks {
						// Your code here
									container.mainContext.insert(task)

					}
				}
									
				}
				}
				return container
}()
