//
//  TodoItem.swift
//  ToDoDemo
//
//  Created by Nyan Lin Tun on 27/7/25.
//

import Foundation

struct TodoItem {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
