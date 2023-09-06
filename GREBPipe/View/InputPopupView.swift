//
//  InputPopupView.swift
//  GREBPipe
//
//  Created by Guillermo Molina on 5/9/23.
//
import SwiftUI
import Foundation


struct InputPopupView: View {
	@Binding var isShown: Bool
	@Binding var userInput: String
	
	
	@Environment(\.modelContext) private var modelContext
	
	enum ObjectType : String, CaseIterable, Identifiable {
		case project, entity, shot
		var id: Self { self }
	}
	
	
	@State private var selectedFlavor: ObjectType = .project
	
	@State var selection_type: String = "project"
	
	
	var body: some View {
		
		VStack {
			Text("Add Element")
				.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
				.bold()
			VStack() {
				List {
					Picker("type", selection: $selectedFlavor) {
						Text("project").tag(ObjectType.project)
						Text("entity").tag(ObjectType.entity)
						Text("shot").tag(ObjectType.shot)
					}
				
				Text("Enter Your Input:")
				
				TextField("Enter something...", text: $userInput)
					.padding()
					.border(Color.gray, width: 0.5)
				
				Button("add") {
					self.isShown.toggle()
						let element:Entity = Entity(name:userInput,category: "char")
						modelContext.insert(element)
					
				}
				Button("cancel") {
					self.isShown.toggle()
				}
				}
			}
		}
	}
	
}

#Preview { InputPopupView(isShown:.constant(true), userInput: .constant("test"))
}
