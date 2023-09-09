//
//  FlowModel.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 9/9/23.
//

import Foundation
import Flow
import SwiftUI
import SwiftData


	
	
class FlowViewModel: ObservableObject {
	@Published var isFlowViewVisible: Bool = true
	@Published var patch = Patch()

    func addNode() {
        let newNode = Node(name: "processor", titleBarColor: Color.red, inputs: ["in"], outputs: ["out"])
        patch.nodes.append(newNode)
    }

    func generateNodesFromEntities() {
			print("Generationg Node From Entitites")
        for entity in SampleEntities.entities {
            let newNode = Node(name: entity.name,
                               titleBarColor: Color.cyan,
                               inputs:["in"],
                               outputs: ["out"])
            patch.nodes.append(newNode)
        }
    }

    func deleteSelectedNode(index: NodeIndex) {
			print("deleting Nodes")
        patch.nodes.remove(at: index)
    }

    func flowOn() {
        isFlowViewVisible = true
    }
    
    func flowOff() {
        isFlowViewVisible = false
    }
	
	
	
}
