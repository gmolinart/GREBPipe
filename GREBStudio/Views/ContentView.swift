//
//  ContentView.swift
//  GREBStudio
//
//  Created by Guillermo Molina on 6/9/23.
//

import SwiftUI
import SceneKit

import SceneKit.ModelIO

struct ContentView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
		.modelContainer(previewContainer)
}

