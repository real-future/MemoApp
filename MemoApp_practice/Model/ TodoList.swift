//
//  DataManager.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import Foundation

struct TodoList {
    
    
    //할 일 빈 배열 생성
    static var list: [Todo] = []
    
    
    //수정하기 (이제 해야함)✅
    static func editTask(todo: Todo, content: String) {
        for index in 0 ..< list.count {
            if list[index].id == todo.id {
                list[index].content = content
            }
        }
    }
    
    
    //완료된 할 일
    static var completeList: [Todo] {
        return list.filter { $0.isCompleted == true }
    }
    
    
    //완료된 할 일 속성 변경해주는 함수
    static func completeTodo(todo: Todo, isComplete: Bool) {
        for index in 0 ..< list.count {
            if list[index].id == todo.id {
                list[index].content = todo.content
                list[index].isCompleted = isComplete
            }
        }
    }
    
    
    //할 일 삭제
    static func deleteTodo(todo: Todo) {
        list.removeAll(where: {$0.id == todo.id})
    }
}


