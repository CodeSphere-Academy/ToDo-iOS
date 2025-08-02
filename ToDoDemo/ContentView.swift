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
    @StateObject private var todoStore = ToDoStore()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoStore.todos) { todo in
                        TodoRowView(todo: todo) {
                            todoStore.toggleComplete(for: todo)
                        }
                        .swipeActions(edge: .trailing) {
                            Button("Delete", role: .destructive) {
                                if let index = todoStore.todos.firstIndex(where: { $0.id == todo.id }) {
                                    todoStore.deleteTodo(at: IndexSet(integer: index))
                                }
                            }
                        }
                    }
                    
                }
                HStack {
                    // TODO: - Need to clear text after add to user preference
                    // TODO: - Block same title in task
                    TextField("Add new task", text: $newTaskTitle)
                    Button("Add") {
                        print("Added - \(newTaskTitle)")
                        todoStore.addTodo(title: newTaskTitle)
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
