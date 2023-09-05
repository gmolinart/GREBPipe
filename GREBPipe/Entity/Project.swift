//
//  Entity.swift
//  GREBAsset
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
public class Project: Identifiable {
	public var id = UUID()
	var name: String
	var category: String
	var detailed_description: String
	var icon: String
	var imageURL: String
	var entities: [Entity] = []
	
	init(name: String,category: String,  detailed_description: String = "", icon:String = "",
			 imageURL: String = "") {
		self.name = name
		self.category = category
		self.detailed_description = detailed_description
		self.icon =  icon
		self.imageURL = imageURL
		
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
	
		
	static func preview() -> Project{
			 Project(name: "indeleble",
						category: "personal",
						imageURL: "indeleble")
		 }
}
