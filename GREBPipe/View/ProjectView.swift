//
//  ProjectView.swift
//  GREBAsset
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
		Text("Hello world")
	}
}

#Preview {
	ProjectView(project:Project.preview())
}
