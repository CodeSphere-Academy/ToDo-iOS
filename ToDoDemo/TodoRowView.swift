//
//  TodoRowView.swift
//  ToDoDemo
//
//  Created by Nyan Lin Tun on 27/7/25.
//

import SwiftUI

struct TodoRowView: View {
    let todo: TodoItem
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(todo.isCompleted ? .green : .gray)
                
            }
            .buttonStyle(PlainButtonStyle())
            Text(todo.title)
                .strikethrough(todo.isCompleted)
                .foregroundStyle(todo.isCompleted ? Color.gray : Color.primary)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TodoRowView(todo: .init(title: "Hello")) {
        
    }
}
