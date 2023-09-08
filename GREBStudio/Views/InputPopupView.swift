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
	@State var category : String
	@State var currentProject: GProject
	@Binding var userInput: String


	
	init(isShown: Binding<Bool>, currentProject: GProject) {
		self._isShown = isShown
		self.category = "prop" 
		self.currentProject = currentProject
		self._userInput = .constant("")
	}

	
	
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
				.font(GrebFont.body)
				.bold()
			VStack() {
				List {
					Picker("type", selection: $category) {
						ForEach(["char","prop","env","shot","lib"], id: \.self){
							Text($0).font(GrebFont.body)
						}
						.font(GrebFont.body)
					}
					.font(GrebFont.body)
					
					HStack {
						Text("Name:").font(GrebFont.body)
						TextField("Enter something...", text:.constant("bs") )
							.padding()
							.font(GrebFont.body)
							.cornerRadius(/*@START_MENU_TOKEN@*/24.0/*@END_MENU_TOKEN@*/)
					}
					
					
					HStack{
						
						Button("add") {
							print("button pressed")
						}
						.font(GrebFont.body)
						Button("cancel") {
							self.isShown.toggle()
						}
						.font(GrebFont.body)
					}
				}
			}
		}
	}
	
}


//#Preview { InputPopupView(isShown:.constant(true), 
//													currentProject: GProject.())
//}
