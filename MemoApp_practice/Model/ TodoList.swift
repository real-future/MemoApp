//
//  DataManager.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import Foundation

struct TodoList {
    
    //sample data
    static var list: [Todo] = [
        Todo(id: 0, content: "안녕하세요", insertDate: Date(), isCompleted: false),
        Todo(id: 1, content: "꼭 완성한다. 꼭.", insertDate: Date(), isCompleted: true)
    ]
    
    static func completeList() -> [Todo] {
        return list.filter { $0.isCompleted == true }
    }
    
    static func completeTodo(todo: Todo, isComplete: Bool) {
        for index in 0 ..< list.count {
            if list[index].id == todo.id {
                list[index].content = todo.content
            }
        }
    }
    static func deleteTodo(todo: Todo) {
        list.removeAll(where: {$0.id == todo.id})
    }
    
}
