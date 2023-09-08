//
//  Entity.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//

import Foundation
import SwiftUI
import SwiftData


/** # Project */
///  This is the project object where
///  shots and entities are stored
///  in general projects are a way to group
///  sequences
@Model///
public class GProject : Identifiable, Decodable, Encodable{
   // Conform to Encodable
   public var id: UUID = UUID()
   var name: String = ""
   var category: String = "personal"
   var detailed_description: String = ""
   var icon: String = ""
   var imageURL: String = ""
   var entities: [GEntity] = []
   
	
   public func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(id, forKey: .id)
       try container.encode(name, forKey: .name)
       try container.encode(category, forKey: .category)
       try container.encode(detailed_description, forKey: .detailed_description)
       try container.encode(icon, forKey: .icon)
       try container.encode(imageURL, forKey: .imageURL)
       try container.encode(entities, forKey: .entities)
   }
   // Conform to Decodable
   public required init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
	
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
		self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
		self.category = try container.decodeIfPresent(String.self, forKey: .category) ?? "personal"
		self.detailed_description = try container.decodeIfPresent(String.self, forKey: .detailed_description) ?? ""
		self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
		self.imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL) ?? ""
		self.entities = try container.decodeIfPresent([GEntity].self, forKey: .entities) ?? []
	}
	
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case category
		case detailed_description
		case icon
		case imageURL
		case entities
	}
	
	private var privateAttribute: String?
	
	init(name: String,
			 category: String = "personal",
			 detailed_description: String = "",
			 icon:String = "",
			 imageURL: String = "",
			 entities: [GEntity]  =  []) {
		
		self.name = name
		self.category = category
		self.detailed_description = detailed_description
		self.icon =  icon
		self.imageURL = imageURL
		self.entities = entities
		
		if icon == ""  {
			set_icon()
		}
		
		
	}
	func set_icon() {
		switch category {
		case "personal":
			self.icon = "person.fill"
		default:
			self.icon = "questionmark.diamond.fill"
		}
	}
	
	
	static func preview() -> GProject{
		GProject(name: "indeleble",
						category: "personal",
						imageURL: "indeleble")
	}
}



//extension GProject: Hashable {
//	static func == (lhs: GProject, rhs: GProject) -> Bool {
//		lhs.name == rhs.name &&
//		lhs.category == rhs.category &&
//		lhs.detailed_description == rhs.detailed_description
//	}
//
//		func hash(into hasher: inout Hasher) {
//				hasher.combine(name)
//				hasher.combine(category)
//				hasher.combine(detailed_description)
//		}
//}
