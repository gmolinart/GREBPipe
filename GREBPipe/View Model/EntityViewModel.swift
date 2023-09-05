//
//  EntityViewModel.swift
//  GREBAsset
//
//  Created by Guillermo Molina on 5/9/23.
//

import Foundation

class EntityListViewModel: ObservableObject {
		
		@Published var entities = [Entity]()
		@Published var searchText: String = ""
		
		var filteredEntities: [Entity] {
				guard !searchText.isEmpty else { return entities }
				return entities.filter { meal in
						meal.name.lowercased().contains(searchText.lowercased())
				}
		}
		
		@Published var suggestions = ["char", "prop", "asset"]
		
		var filteredSuggestions: [String] {
				guard !searchText.isEmpty else { return [] }
				return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
		}
		
		private let service = DataService()
		
		init() {
				load_entities()
		}
	func load_entities(){
			let entities_data = ["prod": ["column"], "prop": ["bolso", "trinket", "headStand", "standingLamp", "cealingLight", "smallShelf", "chandelier", "columnas", "cabezasAnimales", "oldDesk", "cabezas", "cuadro", "box", "desk", "sello", "binder", "boligrafo", "armChair", "columnasGalerias", "scaffolding", "pedestal", "grapadora", "stool", "portaCarpeta", "galeriaPasillo", "paperMountain", "folder", "wallGeneric", "openCupboard", "bookshelf", "ladder", "telephone", "columnaPapel", "pen", "curiosityCabinet", "keyGroup", "smallCupboard", "sofa", "mainDoor", "table", "columnaSp", "cubiertos", "cupboard", "roundTable", "longShelf", "silla", "keys", "fan", "ventana", "grupoCuadros", "portaLapiz", "door"], "char": ["sofia", "oficial"], "lib": ["hdri", "matWood", "matRoad", "defaultShader", "shader", "baseMesh"], "env": ["gallery", "salonCabezas", "salonPrincipal", "palaceofjustice"]]
			load_entities_from_data(entities_data: entities_data)
//			return entities
		}
		
		
	
	func load_entities_from_data(entities_data: [String: [String]]){
		
		for (category, entityNames) in entities_data {
			for entityName in entityNames {
				let entityInstance = Entity(name: entityName, category: category)
				self.entities.append(entityInstance)  // Explicitly refer to class property with 'self.'
			}
		}
}
}
