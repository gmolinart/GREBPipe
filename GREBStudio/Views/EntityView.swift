//
//  ProjectView.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 7/9/23.
//

import SwiftUI
import SwiftData

struct EntityView: View {
	@State public var name: String
	@Query private var entities: [GEntity]
	
	var body: some View {
		let entity = entities.first(where: { $0.name == name})
		
		if let entity = entity{
			VStack{
				Image(entity.name)
					.resizable()
					.aspectRatio(contentMode: .fit)
				
				VStack {
					Text(entity.name)
						.font(GrebFont.title)
					Text("(\(entity.category))")
				}
				
				HStack{
					List(){
						ForEach(entity.tasks , id: \.self) { task in
							HStack{
								Image(systemName: task.icon)
									.frame(width: 20)
								Text(task.name)
							}
						}
						
					}
					.textSelection(/*@START_MENU_TOKEN@*/.enabled/*@END_MENU_TOKEN@*/)
				}
			}
		}
//			.frame(minWidth: 100, minHeight: 30)
//			.padding()
	}
}

//#Preview {
//	EntityView()
//}

