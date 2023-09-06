//
//  ProjectView.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//

import SwiftUI

struct ProjectView: View {
	
	let project: Project
	
	init(project: Project) {
		self.project = project
	}
	
	var body: some View {
		Text(project.name)
		VStack{
			Text("entities")
			Text("entities")
			
		}
			
		}
}

#Preview {
	ProjectView(project:Project.preview())
}
