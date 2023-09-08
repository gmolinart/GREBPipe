
//  ProjectView.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 7/9/23.
//

import SwiftUI
import SwiftData
//
//struct ProjectView: View {
//	@Query private var projects: [GProject]
//	@State private var isPopupShown: Bool = false
//	@State public var project: GProject
//
//
//	var body: some View {
//		Button(action: {
//			self.isPopupShown.toggle()
//		}) {
//			Text("Add Project")
//				.font(GrebFont.body)
//		}
//		.padding()
//
//		//		let project = projects.first(where: { $0.name == projectName })
//		//
//		VStack{
//
////			InputPopupView(isShown:$isPopupShown,
////										 currentProject: project
////			)
////			.frame(width: 600, height: 700)
//
//			ZStack {
//				Image(project.name)
//					.resizable()
//					.padding()
//					.aspectRatio(contentMode: .fit)
//
//
//
//				Text(project.name)
//					.font(GrebFont.title)
//					.offset(CGSize(width: 10.0, height: 60.0))
//					.shadow(radius: 0)
//			}
//
//
//
//			HStack{
//				if project.entities.isEmpty {
//					Button(action: {
//						self.isPopupShown.toggle()
//					}) {
//						Text("Create Entities")
//					}
//				} else {
//					VStack{
//						Text("entities")
//							.font(GrebFont.subheadline)
//						List(){
//
//							ForEach(project.entities , id: \.self) { entity in
//								HStack{
//									Image(systemName: entity.icon)
//									Text(entity.name)
//										.font(GrebFont.body)
//								}}
//							Text("Add Entity")
//								.font(GrebFont.body)
//								.onTapGesture(){
//									self.isPopupShown.toggle()
//								}
//
//						}
//						.padding()
//					}
//				}
//			}
//
//		}
//	}}


struct ProjectView: View{
	
	@State private var isPopupShown: Bool = false
	@State private var project_name: String = ""
	@State private var project: GProject?
	@Query private var projects: [GProject]
	@Environment(\.modelContext) private var modelContext
	
	
	func getProjectByName(name: String) -> GProject? {
		return projects.first(where: { $0.name == name })
	}
	var body: some View{
		
		VStack{
			
			//			InputPopupView(isShown:$isPopupShown,
			//										 currentProject: project
			//			)
			//			.frame(width: 600, height: 700)
			
//				Image(project"s[0].name)
			Text(project?.name ?? "NOT SET")
			ZStack {
				Image("indeleble")
					.resizable()
					.padding()
					.aspectRatio(contentMode: .fit)
				
				
				
				Text("hello")
					.font(GrebFont.title)
					.offset(CGSize(width: 10.0, height: 60.0))
					.shadow(radius: 0)
			}
			
				List{
					ForEach(projects){ project in
						Text(project.name)
						.onTapGesture {
							UserSettings.set_project(project: project)
						}
						
					}
				}
		}

//
//
//			HStack{
//				if project.entities.isEmpty {
//					Button(action: {
//						self.isPopupShown.toggle()
//					}) {
//						Text("Create Entities")
//					}
//				} else {
//					VStack{
//						Text("entities")
//							.font(GrebFont.subheadline)
//						List(){
//
//							ForEach(project.entities , id: \.self) { entity in
//								HStack{
//									Image(systemName: entity.icon)
//									Text(entity.name)
//										.font(GrebFont.body)
//								}}
//							Text("Add Entity")
//								.font(GrebFont.body)
//								.onTapGesture(){
//									self.isPopupShown.toggle()
//								}
//
//						}
//						.padding()
//					}
//				}
//			}
//
//		}
//	}}
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
