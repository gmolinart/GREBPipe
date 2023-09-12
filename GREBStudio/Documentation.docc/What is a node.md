

# What is a Node

### Overview

@Metadata{
	@PageImage(
						 purpose: card,
						 source: "searchbar"
						 )
}
A **node** is a *fundamental concept* in computer graphics and user interfaces (UI) that is used to represent elements and their relationships in a graphical representation. In this documentation page, we will *explore the concept of nodes*, *node graphs*, and *flow graphs*, and how they help with visualizing flows.

### Nodes in Computer Graphics

In computer graphics, a **node** represents an *element or object* in a scene. It can be a *3D object, a light source, a camera*, or any other *component that contributes to the visual representation*. Nodes can have properties such as *position, rotation, scale, and material properties*, which define their *appearance and behavior*. 🎨

### Node Graphs

A node graph is a visual representation of a network of interconnected nodes. It is commonly used in computer graphics software to create and manipulate complex scenes. In a node graph, nodes are represented as graphical elements, and the connections between nodes represent relationships or dependencies.

Node graphs provide a visual and intuitive way to design and modify complex scenes. By connecting nodes together, users can define relationships between objects, apply transformations, and control the behavior of the scene. This visual representation makes it easier to understand and modify the structure and behavior of the scene.

### Flow Graphs

Flow graphs are a specific type of node graph that is used to represent the flow of data or control in a system. In a flow graph, nodes represent operations or functions, and the connections between nodes represent the flow of data or control between them.

Flow graphs are commonly used in visual programming environments, game engines, and data processing systems. They provide a visual and intuitive way to design and modify the flow of data or control in a system. By connecting nodes together, users can define the sequence of operations, apply conditions, and control the flow of data or control.

### Visualizing Flows

Nodes and node graphs are powerful tools for visualizing flows in computer graphics and UI design. They provide a visual representation of complex relationships and dependencies, making it easier to understand and modify the structure and behavior of a system.

By using nodes and node graphs, designers and developers can:

- 🎨 Easily create and modify complex scenes or systems by connecting nodes together.
- 🐞 Visualize the flow of data or control in a system, making it easier to understand and debug.
- 🔬 Experiment with different configurations and arrangements of nodes to achieve the desired result.
- 🤝 Collaborate and communicate ideas more effectively by using a visual representation.

In conclusion, nodes and node graphs are *essential concepts* in computer graphics and UI design. They provide a visual and intuitive way to represent elements and their relationships, making it easier to design, modify, and understand complex systems. Whether it's creating 3D scenes, designing user interfaces, or visual programming, nodes and node graphs play a *crucial role* in visualizing flows.

### 

## History


@Video(poster:"alan_kay_demo_grail" ,alt: "a video of alan Kay showing a graphical interface")


I came across a collection on Twitter by Eric Hosick that aims to document the evolution and explosion of node graph user interfaces in software applications. The collection includes snapshots of all node graph user interfaces. The history of node graph architectures and visual programming can be traced back to the 1960s, in the area known as "man-machine communications". One of the earliest investigations in dataflow-based workflows or programs was William Robert Sutherland's MIT thesis (1966) "Online Graphical Specification of Procedures". Since then, node graph architectures have been used in computer-aided design (CAD) and have become a fundamental concept in computer graphics and UI design.

[Visual Programming Languages - Snapshots](http://blog.interfacevision.com/design/design-visual-progarmming-languages-snapshots/)

 [Eric Hosick](https://twitter.com/erichosick) on [Twitter](https://en.wikipedia.org/wiki/Twitter) to collect snapshots of all node graph user interfaces in most [software applications](https://en.wikipedia.org/wiki/Application_software). The effort attempts to document the evolution and explosion of node graph user interfaces starting from their initial roots. This visual history is hosted on a blog page called [Visual Programming Languages - Snapshots](http://blog.interfacevision.com/design/design-visual-progarmming-languages-snapshots/). Work leading to node graph architectures and visual programming seems to have started in the 1960s, in the area known as "man-machine communications".

In [William Robert Sutherland's MIT thesis (1966) "Online Graphical Specification of Procedures"](https://dspace.mit.edu/handle/1721.1/13474?show=full), he describes and analyses topics around a 2D pictorial language. This is one of the first investigations in [dataflow-based](https://en.wikipedia.org/wiki/Dataflow_programming) workflows or programs. Since then his thesis has been used as "prior art" in order to quash lawsuits about dataflow ideas today. His work is often thought to have led the way to what is known as [computer-aided design (CAD)](https://en.wikipedia.org/wiki/Computer-aided_design) today.

1. *A pictorial program is a natural way of expressing parallel processes. The two-dimensional nature of the language helps in visualizing many things happening at once.*
		
		[[1]](https://en.wikipedia.org/wiki/Node_graph_architecture#cite_note-william_sutherland_1-1)
		
2. *The ease of debugging programs, particularly parallel ones, will be enhanced by a pictorial language form. Being able to attach data probes and to see a program run gives one a grasp of detail that is hard to obtain in any other way.*
		
		[[1]](https://en.wikipedia.org/wiki/Node_graph_architecture#cite_note-william_sutherland_1-1)
		
3. *A program's execution need not be controlled by the usual explicit sequential flow conventions. The movement of data through a program may determine its operation. A data controlled convention corresponds closely to our intuitive ideas of how a graphical program should operate and also allows parallel programming without explicit flow designations.*
		
		[[1]](https://en.wikipedia.org/wiki/Node_graph_architecture#cite_note-william_sutherland_1-1)
		

In 1969, T. O. Ellis, J. F. Heafner, and W. L. Sibley published a paper concerning a [Graphical Input Language (GRAIL)](https://www.rand.org/content/dam/rand/pubs/research_memoranda/2005/RM5999.pdf). Their work was related to the [RAND Tablet](https://en.wikipedia.org/wiki/RAND_Tablet) which began with research on [Sketchpad](https://en.wikipedia.org/wiki/Sketchpad), a system where users could write computer commands directly on a tablet, conducted by [Ivan Sutherland](https://en.wikipedia.org/wiki/Ivan_Sutherland). The GRAIL system used a flowchart-based graphical programming language and could recognize handwritten letters and gestures.[[2]](https://en.wikipedia.org/wiki/Node_graph_architecture#cite_note-grail_1-2) [Alan Kay](https://en.wikipedia.org/wiki/Alan_Kay) has given a number of [demos of the GRAIL system](https://www.youtube.com/watch?v=QQhVQ1UG6aM), however, he was not involved with the creation of the system.

1. *Important organizational concepts in the GRAIL system are the sequential flow of control, the hierarchy of subroutines, and the language (flow diagrams) for pictorially relating the organization within the concepts of the first two.*
		
		
2. *The sequential nature of control allows the man to envision isolated processes that are adapted to specific functions--which, in turn, allow the organizer to think of the total program in terms of manageable subparts.*
		
		
3. *The subroutine hierarchy emphasizes the notion of isolated processes even more strongly.*
		
		
4. *Flow diagrams help the man to picture his control options and the relationship between processes by expressing these interrelationships in two dimensions.*
		
		

Blender node graph, 2006

!https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Working_with_Nodes_Blender.PNG/400px-Working_with_Nodes_Blender.PNG

Some of the more recent uses of node graph architectures started around 2005. Node graphs in this time frame start to develop paradigms to deal with complexity in the node graph. The complexity arose as the number of nodes and links in the graph increased. One of the main ideas dealing with complexity was the concept of a group or package node which hid nodes inside of itself, only exposing the inputs and outputs of the group.

- [Katana, Foundry](https://learn.foundry.com/katana/Content/ug/node_graph.html)
- [Houdini, SideFX](https://www.sidefx.com/docs/houdini/network/layout.html)
- [Nuke, Foundry](https://learn.foundry.com/nuke/content/getting_started/meet_nuke/key_concepts.html)
- [Mari, Foundry](https://learn.foundry.com/mari/Content/user_guide/node_graph/node_graph_intro.html)
- [Maya, Autodesk](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2020/ENU/Maya-Basics/files/GUID-92F35EC2-35BF-49AB-8CDE-9DE922EA85A1-htm.html)
- [Blender](https://docs.blender.org/manual/en/latest/editors/shader_editor.html)
- [Grasshopper, McNeel & Associates](https://www.rhino3d.com/6/new/grasshopper/)
- [Dynamo, Autodesk](https://primer.dynamobim.org/03_Anatomy-of-a-Dynamo-Definition/3_anatomy-of-a-dynamo-definition.html)

