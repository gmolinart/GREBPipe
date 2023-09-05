//
//  DetailView.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI
import OSLog


struct DetailView: View {
	
	let entity: Entity
	@State private var selectedCategory: String
	@StateObject var model = WebViewModel()
	
	init(entity: Entity) {
		self.entity = entity
		_selectedCategory = State(initialValue: entity.category)
	}
	
	var body: some View {
		HStack{
			VStack {
				HStack {
					Image(entity.name)
						.resizable()
						.scaledToFit()
						.clipShape(RoundedRectangle(cornerRadius: 20))
						.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
					VStack{
						Picker("Version", selection: $selectedCategory) {
							ForEach(["000.001", "000.002", "000.003", "000.004"], id: \.self) {
								Text($0).tag($0)
							}
						}
						
					}
					
				}
				
				VStack {
					HStack {
						Text(entity.name)
							.font(.title)
							.bold()
						Spacer()
						Text(entity.name)
							.font(.subheadline)
					}
					.padding(.bottom, 1)
					
					Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at ante scelerisque, vehicula mi vitae, vulputate lacus. Mauris porttitor justo ac pulvinar ultrices. Quisque sed erat molestie ex consequat condimentum ac at est. Duis maximus nunc sed ipsum iaculis, ac ultrices magna fringilla. Pellentesque quis nulla justo. In pellentesque augue ullamcorper arcu volutpat aliquet. Duis iaculis tortor nec massa tincidunt, in cursus elit gravida. Vestibulum fringilla urna vel porta mattis. Etiam interdum blandit nulla. Cras pellentesque, risus vitae ultricies faucibus, quam turpis feugiat orci, id tempus mi metus vel purus. ")
					
					Spacer()
				}
				.padding(.horizontal, 15)
#if os(iOS)
				.navigationBarTitleDisplayMode(.inline)
#endif
			}
			VStack{
				List(){
					
				}
				TextEditor(text: .constant("Add Comments"))
				Button("Send"){
					Logger().info("adding comment")
					
				}
				.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
				
			}
			WebView(webView: model.webView)
		}
		.padding(.all)
		.navigationTitle(entity.name)
		
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(entity: Entity.preview())
	}
}
