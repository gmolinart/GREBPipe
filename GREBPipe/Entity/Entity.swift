//
//  Entity.swift
//  GREBAsset
//
//  Created by Guillermo Molina on 5/9/23.
//

import Foundation
import SwiftUI
import SwiftData

public class Entity: Identifiable {
	public var id = UUID()
	var name: String
	var category: String
	var detailed_description: String
	var icon: String
	var imageURL: String
	
	init(name: String,category: String,  detailed_description: String = "", icon:String = "archivebox.fill",
			 imageURL: String = "") {
		self.name = name
		self.category = category
		self.detailed_description = detailed_description
		self.icon =  icon
		self.imageURL = imageURL
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
	
		
	static func preview() -> Entity{
			 Entity(name: "sofia",
						category: "char",
						imageURL: "sofia")
		 }
}
