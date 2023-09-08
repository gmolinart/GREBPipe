
//  ProjectView.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 7/9/23.
//

import SwiftUI
import SwiftData



struct ProjectView: View {
	
	@State private var isPopupShown: Bool = false
	@State private var project_name: String = ""
	@State private var project: GProject?
	@Query private var projects: [GProject]
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		
		VStack(){
			Image("GrebLogo")
				.resizable()
				.scaledToFit()
				.aspectRatio(contentMode: .fit)
				.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
				.padding()
		}
		VStack{
				ZStack {
					RoundedRectangle(cornerRadius: 10)
					.onHover { hover in
						if hover {
							RoundedRectangle(cornerRadius: 10)
						}
					}
					

					Text(user_project.name)
					
						.font(GrebFont.title)
				}
				.padding()
			
		}
	}
	
}


struct AddProjectView: View {
	
	@State private var isPopupShown: Bool = false
	@State private var project_name: String = ""
	@State private var project: GProject?
	@Query private var projects: [GProject]
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		
		VStack(){
			Image("GrebLogo")
				.resizable()
				.scaledToFit()
				.aspectRatio(contentMode: .fit)
				.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
				.padding()
			Text("Welcome, please add a project")
				.font(GrebFont.body)
		}
		VStack{
			List{
				ForEach(projects){ project in
					Text(project.name)
					
				}
			}
		}
		VStack{
			TextField("Project Name", text: $project_name)
					.font(GrebFont.body)
					.padding()

			Button(action: {
				print(project_name)
				modelContext.insert(GProject(name: project_name))
				self.isPopupShown.toggle()
			}) {
				Text("Add Project")
					.font(GrebFont.body)
			}
			.padding()
			
		}
	}
	
}


//			#Preview {
//				ProjectView(project: GProject.preview())
//					.modelContainer(previewContainer)
//			}


//
//#Preview {
//	AddProjectView()
//	
//	ProjectView(project:GProject.preview())
//}


#Preview{
//	AddProjectView()
	
	ProjectView()
		.modelContainer(previewContainer)
}
