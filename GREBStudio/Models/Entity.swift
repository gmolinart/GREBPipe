//
//  Entity.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//

import Foundation
import SwiftUI
import SwiftData



@Model 
public class GEntity: Identifiable , Decodable ,Encodable{
	// Conform to Encodable
	public var id: UUID = UUID()
	var name: String = ""
	var category: String = ""
	var detailed_description: String? = nil
	var icon: String? = nil
	var imageURL: String? = nil
	var comments: [String]? = nil
	// Make tasks conform to Sequence
	var tasks: [GTask] = [] 
	
	
	
	@Relationship(deleteRule: .cascade, inverse: \GProject.entities)
	var project: GProject? = nil
	
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		try container.encode(category, forKey: .category)
		
		try container.encode(detailed_description, forKey: .detailed_description)
		try container.encode(icon, forKey: .icon)
		try container.encode(imageURL, forKey: .imageURL)
		try container.encode(comments, forKey: .comments)
		try container.encode(tasks, forKey: .tasks)
	}
	
	public required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(UUID.self, forKey: .id)
		self.name = try container.decode(String.self, forKey: .name)
		self.category = try container.decode(String.self, forKey: .category)
		
		self.detailed_description = try? container.decode(String.self, forKey: .detailed_description)
		self.icon = try? container.decode(String.self, forKey: .icon)
		self.imageURL = try? container.decode(String.self, forKey: .imageURL)
		self.comments = try? container.decode([String].self, forKey: .comments)
		self.tasks = try! container.decode([GTask].self, forKey: .tasks)
	}
	
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case category
		case detailed_description
		case icon
		case imageURL
		case comments
		case tasks
	}
	
	
	init(name: String,
			 project: GProject,
			 category: String,
			 detailed_description: String = "",
			 icon:String = "archivebox.fill",
			 imageURL: String = "",
			 comments:[String] = [] ,
			 tasks:[GTask] = []) {
		
		self.name = name
		self.project = project
		self.category = category
		self.detailed_description = detailed_description
		self.icon =  icon
		self.imageURL = imageURL
		self.comments = comments
		self.tasks = tasks
		set_icon()
		
		
	}
	func set_icon() {
		switch category {
		case "char":
			self.icon = "person.fill"
		case "prop":
			self.icon = "shippingbox.fill"
		case "lib":
			self.icon = "folder.fill"
		case "env":
			self.icon = "house"
		default:
			self.icon = "questionmark.diamond.fill"
		}
	}
	
	
	static func preview() -> GEntity{
		let project  = GProject(name: "indeleble",
														category: "personal",
														imageURL: "indeleble")
		
		let preview = GEntity(name: "sofia",
													project: project,
													category: "char"
		)
		//	  let task = GTask(name: "mdl", entity: preview)
		let task = GTask(name: "mdl")
		//		preview.tasks.append(task)
		print(task)
		return preview
	}
}

