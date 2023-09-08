
import Foundation


struct SampleEntities {
	
	static var entities: [GEntity] = [GEntity(name: "sofia", project: GProject(name:"indeleble"),
																category: "char",
																detailed_description: "main character of the film",
																tasks: [GTask(name:"mdl"),
																				GTask(name:"rig"),
																				GTask(name:"cfx"),
																				GTask(name:"tex")
																			 ]
																),
																GEntity(name: "julia", project: GProject(name:"indeleble"),
																category: "char",
																detailed_description: "supporting character of the film",
																tasks: [GTask(name:"mdl"),
																				GTask(name:"rig"),
																				GTask(name:"cfx"),
																				GTask(name:"tex")
																			 ]
																)
																]
}

struct SampleProject{
	
	static var contents: [GProject] = [GProject(name: "indeleble",
																							category: "personal",
																							imageURL: "indeleble"
																							
																						 )]
}
