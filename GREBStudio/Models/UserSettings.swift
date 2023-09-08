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
	public var id: UUID = UUID()
	static var shared = UserSettings()
	public var project: GProject?
	
	

	
		func get_project() -> GProject? {
				return self.project
		}
	
		public static func set_project(project: GProject) {
			self.project = project
			print("setting project!!! Fantastic")
		}
	  
}

//
//@Model///
//public class UserSettings: {
//   // Conform to Encodable
//   public var id: UUID = UUID()
//   var name: String = ""
//   var project: GProject?
//   var entity: GEntity?  
//   
//	
//   public func encode(to encoder: Encoder) throws {
//       var container = encoder.container(keyedBy: CodingKeys.self)
//       try container.encode(id, forKey: .id)
//       try container.encode(name, forKey: .name)
//   }
//   // Conform to Decodable
//   public required init(from decoder: Decoder) throws {
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//	
//		self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
//		self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
//	}
//	
//	private enum CodingKeys: String, CodingKey {
//		case id
//		case name
//	}
//	
//	init(name: String) {
//		
//		self.name = name
//		
//		
//	}
//	
//}
//
