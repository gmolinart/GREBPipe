//
//  ProjectView.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 7/9/23.
//

import SwiftUI
import SwiftData

struct EntityListView: View {
	@Query private var entities: [GEntity]
	
	var body: some View {
		VStack{
			HStack {
				Text("project:")
				Text(user_project.name)
				.font(GrebFont.title)
			}
			//			Text(entities[0].name)
			NavigationView{
				List(){
					ForEach(entities){ entity in
						HStack {
							NavigationLink(destination: 
								VStack {
								
									EntityView(entity: entity)
								}
							) {
								Text(entity.name)
							}
						}
						
					}
				}
			}
			.padding()
		}
	}
}

//
//  DetailView.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI
import OSLog

#if os(macOS)
import AppKit
#endif

struct EntityView: View {
	let entity: GEntity
	@State private var selectedCategory: String
	@State private var editedText : String = ""
	@State private var isEditing = false
	@State private var isCommentsViewCollapsed: Bool = false
	@State private var currentComment : String = ""
	
	init(entity: GEntity) {
		self.entity = entity
		self.editedText = entity.detailed_description ?? ""
		
		_selectedCategory = State(initialValue: entity.category)
	}
	
	var body: some View {
		HStack{
			VStack {
				HStack {
					Image(entity.name)
						.resizable()
						.scaledToFit()
						.frame(width: 100, height: 100, alignment: .center)
					
						.clipShape(RoundedRectangle(cornerRadius: 20))
						.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
				}
				
				VStack {
					VStack {
						Text(entity.name)
							.font(GrebFont.title)
							.bold()
						HStack{
#if DEBUG
							let tasks : [String] = ["pencil.and.ellipsis.rectangle" ,"gearshape.fill","book.fill" ,"sparkles" ]
				
							ForEach(entity.tasks, id: \.self) { task in
								Image(systemName: task.icon)
									.onTapGesture {
										print(task.icon)
									}
								
							}
#else
							ForEach(entity.tasks, id: \.self) { task in
								Image(systemName: task.icon)
									.onHover { isHovered in
										if isHovered {
											Image(systemName: task.icon)
												.colorMultiply(.blue)
										} else {
											Image(systemName: task.icon)
										}
									}
									.onTapGesture {
										print(task.icon)
									}
								
							}
#endif
						}
						
					}
					.padding(.bottom, 1)
					
					if isEditing {
						VStack{
							TextEditor(text: $editedText)
								.font(GrebFont.body)
							
							Button("Done"){
								entity.detailed_description =  editedText
								isEditing = false
							}
						}
					} else {
//						Text((((entity.name.isEmpty) != nil) ? "No description" : entity.detailed_description) ?? "")
						Text(entity.detailed_description ?? "NO Description"
						)
							.font(GrebFont.body)
							.frame(width: 200, height: 100, alignment: .center)
							.contextMenu {
								Button(action: {
#if os(macOS)
									let pasteboard = NSPasteboard.general
									pasteboard.clearContents()
									pasteboard.setString(entity.detailed_description ?? "" , forType: .string)
#endif
								}) {
									Text("Copy")
										.font(GrebFont.body)
									Image(systemName: "doc.on.doc")
								}
							}
						
							.onTapGesture(count: 2) {
								isEditing = true
							}
					}
					Spacer()
				}
				.padding(.horizontal, 15)
#if os(iOS)
				.navigationBarTitleDisplayMode(.inline)
#endif
			}
			
			
							CommentsView(entity:entity)
			
			//			CommentsView(entity:entity)
			
			//			WebView(webView: model.webView)
			

			
		}
		.padding(.all)
		.navigationTitle(entity.name)
		
	}
}

//
	struct CommentsView: View {
		@State private var entity: GEntity
		@State private var currentComment: String = ""

		init(entity: GEntity) {
			self._entity = State(initialValue: entity)
		}

		var body: some View {
			VStack{
				Text("Comments")
					.font(GrebFont.title)
				VStack{
					List{
//						ForEach(entity.comments, id: \.self) { comment in
//							Text(comment)
//								.font(GrebFont.body)
//						}
					}
					TextEditor(text: $currentComment)
						.font(GrebFont.body)
					Button("Send"){
//						entity.comments.append(currentComment)
						currentComment = ""
						Logger().info("adding comment")
					}
					.padding(.all)
					.font(GrebFont.body)
				}
			}
				.padding()
		}
	}
//




#Preview {
	EntityListView()
		.modelContainer(previewEntitiesContainer)
}

