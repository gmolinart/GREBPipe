//
//  UserSettings.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 7/9/23.
//


import Foundation
import SwiftUI
import SwiftData


@Model
class UserSettings {
	// The unique identifier for the user settings
	public var id: UUID = UUID()
	
	// Singleton instance of UserSettings
	static var shared = UserSettings()
	
	// The current project associated with the user settings
	public var project: GProject?
	
	// The name of the user
	public var name: String = ""
	
	
	init(name: String, project: GProject?) {
		self.name = name
		self.project = project
	}
	
		func get_project() -> GProject? {
				return self.project
		}
	
		public static func set_project(project: GProject) {
			UserSettings.shared.project = project
			
			print("setting project!!! Fantastic")
		}
	  
}

