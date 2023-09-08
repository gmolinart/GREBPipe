
import Foundation
import SwiftUI
import SwiftData

/** # Task */
///  This is the project object where
///  shots and entities are stored
///  in general projects are a way to group
///  sequences

@Model public class GTask: Identifiable , Decodable,Encodable {
	public var id: UUID = UUID()
	var name: String = ""
	var detailed_description: String = ""
	var icon: String = ""
	var imageURL: String = ""
	var comments: [String] = []
	var versions: [String] = []
	private var long_name: String = ""
	
	// Conform to Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		try container.encode(detailed_description, forKey: .detailed_description)
		try container.encode(icon, forKey: .icon)
		try container.encode(imageURL, forKey: .imageURL)
		try container.encode(comments, forKey: .comments)
		try container.encode(versions, forKey: .versions)
		try container.encode(long_name, forKey: .long_name)
	}
	// Conform to Decodable
	public required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(UUID.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
		detailed_description = try container.decode(String.self, forKey: .detailed_description)
		icon = try container.decode(String.self, forKey: .icon)
		imageURL = try container.decode(String.self, forKey: .imageURL)
		comments = try container.decode([String].self, forKey: .comments)
		versions = try container.decode([String].self, forKey: .versions)
		long_name = try container.decode(String.self, forKey: .long_name)
	}
	
	// Define CodingKeys
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case detailed_description
		case icon
		case imageURL
		case comments
		case versions
		case long_name
	}

	
	
	init(name: String,
//			 entity: GEntity,
			 detailed_description: String = "",
			 icon:String = "archivebox.fill",
			 imageURL: String = "" ,
			 comments: [String] = [""] ,
			 versions: [String] = []) {
		self.name = name
//		self.entity = entity
		self.detailed_description = detailed_description
		self.icon =  icon
		self.imageURL = imageURL
		self.comments = comments
		self.versions =  versions
		self.long_name = ""
		
		set_icon()
		
		
	}
	public struct TaskDetail: Codable {
		let icon: String
		let longName: String
	}
	
	public var taskDetails: [String: TaskDetail] = [
		"mdl": TaskDetail(icon: "pencil.and.ellipsis.rectangle", longName: "Modeling"),
		"rig": TaskDetail(icon: "gearshape.fill", longName: "Rigging"),
		"ref": TaskDetail(icon: "book.fill", longName: "Reference"),
		"cfx": TaskDetail(icon: "sparkles", longName: "CharFX"),
		"default": TaskDetail(icon: "questionmark.diamond.fill", longName: "default")
	]
	
	func set_icon() {
		if let details = taskDetails[name] {
			self.icon = details.icon
			self.long_name = details.longName
		} else {
			self.icon = taskDetails["default"]?.icon ?? "questionmark.diamond.fill"
			self.long_name = taskDetails["default"]?.longName ?? "default"
		}
	}
	
//	static func preview() -> GTask{
//		
//		let project  = GProject(name: "indeleble",
//														category: "personal",
//														imageURL: "indeleble")
//		
//		let entity = GEntity(name: "sofia",
//												 project: project,
//												 category: "char" )
//		
////		let task: GTask =  GTask(name: "mdl", entity:entity)
//		let task: GTask =  GTask(name: "mdl" )
//		return task
//	}
	
}

