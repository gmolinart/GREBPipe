
//  ProjectView.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 7/9/23.
//

import SwiftUI
import SwiftData



struct ProjectView: View {
	
	@State private var isEntityListVisible: Bool = false
	@State private var project_name: String = ""
	@State private var project: GProject?
	@Query private var projects: [GProject]
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		
		VStack(){
			Image("GREBLogo")
				.resizable()
				.scaledToFit()
				.aspectRatio(contentMode: .fit)
				.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
				.padding()
		}
		VStack{
			ZStack {
				Spacer()
				Button(action: {
					self.isEntityListVisible = true
				}) {
					Text(user_project.name)
				}
				.sheet(isPresented: $isEntityListVisible) {
					EntityListView()
				}
				
			}
			.padding()
		}
		
		
			.font(GrebFont.title)
	}
	
}



struct AddProjectView: View {
	
	@State public var visibility: Bool = true
	@State private var project_name: String = ""
	@State private var project: GProject?
	@Query private var projects: [GProject]
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		
		VStack(){
			Image("GREBLogo")
				.resizable()
				.scaledToFit()
				.aspectRatio(contentMode: .fit)
				.padding()
			Text("PROJECTS")
				.font(GrebFont.body)
		}
		VStack{
			List{
				ForEach(projects){ project in
					Text(project.name)
						.font(GrebFont.body)
						.onTapGesture {
							self.visibility = false }
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
		AddProjectView()
			.modelContainer(previewContainer)
	
//	ProjectView()
//		.modelContainer(previewContainer)
}
