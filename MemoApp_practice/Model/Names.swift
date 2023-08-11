//
//  Names.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/11.
//

import Foundation

enum Names {
    struct greetingText {
        static let noList = "There are no lists to display.\nTry adding a new task :)"
        static let yesList = ""
        static let noDoneList = "You haven't completed anything yet."
        static let yesDoneList = ""
    }
    
    
    struct shape {
        static let circle = "circle"
        static let checkmarkcirclefill = "checkmark.circle.fill"
    }
    
    struct deleteAlert {
        static let title = "Conform Delete"
        static let message = "Are you sure you want to delete me?"
    }
    
    struct addAlert {
        static let title = "Add a Task"
        static let message = ""
        static let placeholder = "Please Enter Anything"
        
    }
}
