//
//  GREBStudioApp.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 6/9/23.
//

import SwiftUI
import SwiftData

@main
struct GREBStudioApp: App {
	
	
	var body: some Scene {
		WindowGroup {
			
//			AddProjectView()
//				.modelContainer(for :GProject.self)
			
			
			
			ProjectView()
				.modelContainer(for: [GProject.self])
		}
			
//				.modelContainer(for: [GProject.self])
//		}
			
//			EntityView()
//					.modelContainer(for :[GProject.self,
//														GEntity.self,
//														GTask.self])
//			ProjectView(projectName: "indeleble")
//					.modelContainer(for :[GProject.self,
//														GEntity.self,
//														GTask.self])
			
	}
}
