//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Nyan Lin Tun on 27/7/25.
//

import SwiftUI

// top: top
// bottom : bottom
// left: leading
// right: trailing
struct ContentView: View {
    @State var newTaskTitle = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Text("One")
                        .swipeActions(edge: .trailing) {
                            Button("Delete", role: .destructive) {
                                print("deleted")
                            }
                        }
                    Text("Two")
                        .swipeActions(edge: .leading) {
                            Button("Update") {
                                print("updated")
                            }
                        }
                }
                HStack {
                    TextField("Add new task", text: $newTaskTitle)
                    Button("Add") {
                        print("Added - \(newTaskTitle)")
                    }
                    .disabled(newTaskTitle.isEmpty)
                }
                .padding()
            }
            .navigationTitle("To-Do List")
        }
    }
}

#Preview {
    ContentView()
}
