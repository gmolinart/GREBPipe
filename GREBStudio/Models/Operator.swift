
//
//  Entity.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//

import Foundation
import SwiftUI
import SwiftData

/// `Operator` is a class that represents an operator in the GREBPipe system.
///
/// It conforms to `Identifiable`, `Decodable`, and `Encodable` protocols.
/// Each operator has a unique `id`, a `name`, a `category`, and other optional properties.
///
/// You can encode an instance of `Operator` into a JSON object, or decode it from a JSON object.
/// The Operator class in the provided Swift code represents an operator in the GREB system. An operator in this context is a function or action that can be requested from a computer.
///
///Each Operator instance has several properties:
///
///- id: A unique identifier for the operator.
///- name: The name of the operator.
///- category: The category of the operator.
///- detailed_description: A detailed description of the operator. /This property is optional.
///- icon: The icon of the operator. This property is optional.
///- imageURL: The URL of the operator's image. This property is /optional.
///- comments: The comments of the operator. This property is /optional.
///- keywords: Keywords are how we define how we call the command for /the operator. For example, for the open flow operator, the keyword /is 'open'. This property is optional.
///- commands: The commands of the operator. This property is /optional.
///- context: The context of the operator. If empty, it runs /everywhere, but you can set the context.
///
///The Operator class also includes methods for encoding and decoding /instances to and from JSON, as well as a method to set the icon /based on the category of the operator.
///
///In the GREB system, operators are used in a command-like syntax. /For example, you might have commands like open project greb, open /group entities, create prop toy car, or write email saying that /{shot} was created. The first word in each command (open, create, /write) is a keyword that corresponds to an operator. The rest of /the command provides context or arguments for the operator.
///
///Operators can be associated with a specific project, and different groups within a project can have different sets of operators. This allows for flexible and context-specific command handling. If a command is not recognized, the system can provide help or error messages to guide the user.// The Operator class in the provided Swift code represents an operator in the GREB system. An operator in this context is a function or action that can be requested from a computer.
///
/// Each Operator instance has several properties:
/// - id: A unique identifier for the operator.
/// - name: The name of the operator.
/// - category: The category of the operator.
/// - detailed_description: A detailed description of the operator. This property is optional.
/// - icon: The icon of the operator. This property is optional.
/// - imageURL: The URL of the operator's image. This property is optional.
/// - comments: The comments of the operator. This property is optional.
/// - keywords: Keywords are how we define how we call the command for the operator. For example, for the open flow operator, the keyword is 'open'. This property is optional.
/// - commands: The commands of the operator. This property is optional.
/// - context: The context of the operator. If empty, it runs everywhere, but you can set the context.
/// The Operator class also includes methods for encoding and decoding instances to and from JSON, as well as a method to set the icon based on the category of the operator.
/// In the GREB system, operators are used in a command-like syntax. For example, you might have commands like open project greb, open group entities, create prop toy car, or write email saying that {shot} was created. The first word in each command (open, create, write) is a keyword that corresponds to an operator. The rest of the command provides context or arguments for the operator.
/// Operators can be associated with a specific project, and different groups within a project can have different sets of operators. This allows for flexible and context-specific command handling. If a command is not recognized, the system can provide help or error messages to guide the user.
@Model
public class Operator: Identifiable , Decodable ,Encodable{
    /// The unique identifier of the operator.
    public var id: UUID = UUID()
    
    /// The name of the operator.
    var name: String = ""
    
    /// The category of the operator.
    var category: String = ""
    
    /// A detailed description of the operator. This property is optional.
    var detailed_description: String? = nil
    
    /// The icon of the operator. This property is optional.
    var icon: String? = nil
    
    /// The URL of the operator's image. This property is optional.
    var imageURL: String? = nil
    
    /// The comments of the operator. This property is optional.
    var comments: [String]? = nil
    
	/// Keywords arehow we define how we call the command for 
	/// example on the `open flow` operator the keyword is 
	///  'open'  
    var keywords: [String]? = nil
	
	
    var commands: [String]? = nil
    
    /// The context of the operator
	/// If empty it runs everywhere but you can set the context
    var context: String = ""
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		try container.encode(category, forKey: .category)
		try container.encode(detailed_description, forKey: .detailed_description)
		try container.encode(icon, forKey: .icon)
		try container.encode(imageURL, forKey: .imageURL)
		try container.encode(comments, forKey: .comments)
		try container.encode(keywords, forKey: .keywords)
//		try container.encode(commands , forKey: .commands)
		try container.encode(context, forKey: .name)
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
		self.keywords = try? container.decode([String].self, forKey: .keywords)
//		self.commands = try? container.decode([String].self, forKey: .commands)
	}
	
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case category
		case detailed_description
		case icon
		case imageURL
		case comments
		case keywords
	}
	
	
	init(name: String,
			 category: String,
			 detailed_description: String = "",
			 icon:String = "archivebox.fill",
			 imageURL: String = "",
			 comments:[String] = [] ,
			 keywords:[String] = [],
			 tasks:[GTask] = []) {
		
		self.name = name
		self.category = category
		self.detailed_description = detailed_description
		self.icon =  icon
		self.imageURL = imageURL
		self.comments = comments
		self.keywords = keywords
//		set_icon()
		
		
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
	}
	
	
func preview() -> Operator{
		
		let preview = Operator(name: "open_terminal",
													category: "system"
		)
		//	  let task = GTask(name: "mdl", entity: preview)
		let task = GTask(name: "mdl")
		//		preview.tasks.append(task)
		print(task)
		return preview
	}


