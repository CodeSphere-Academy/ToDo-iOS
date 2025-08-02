//
//  ToDoStore.swift
//  ToDoDemo
//
//  Created by Nyan Lin Tun on 2/8/25.
//

import Foundation

// Store - Done
// Delete - Done
// Update - Done
// Read

class ToDoStore: ObservableObject {
    @Published var todos: [TodoItem] = []
    let userDefaults = UserDefaults.standard
    let todosKey = "SavedTodos"
    
    init() {
        self.loadTodos()
    }
    
    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)
        saveTodos()
    }
    
    func saveTodos() {
        if let encode = try? JSONEncoder().encode(todos) {
            userDefaults.set(encode, forKey: todosKey)
        } // Should write else case for error handling
    }
    
    func loadTodos() {
        if let data = userDefaults.data(forKey: todosKey) {
            if let decode = try? JSONDecoder().decode([TodoItem].self, from: data) {
                self.todos = decode
            } // decode error handle
        }
    }
    
    func deleteTodo(at index: IndexSet) { // IndexSet = Int
        todos.remove(atOffsets: index)
        saveTodos()
    }
    
    func toggleComplete(for todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            saveTodos()
        }
    }
}

