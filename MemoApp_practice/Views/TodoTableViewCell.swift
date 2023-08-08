//
//  TodoTableViewCell.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import UIKit//commit


class TodoTableViewCell: UITableViewCell {
  

    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var todoSubLabel: UILabel!
    
 
    var todo: Todo?
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressedButton(_ sender: Any) {
        print(#function)

        //isCompleted
//            guard let todo else { return }
//
//            if todo.isCompleted == false {
//                doneButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
//                TodoList.completeTodo(todo: todo, isComplete: true)
//
//            } else {
//                doneButton.setImage(UIImage(systemName: "circle"), for: .normal)
//                TodoList.completeTodo(todo: todo, isComplete: false)
//
//            }

        
        
        
        doneButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        todoLabel.textColor = UIColor.lightGray

        todoSubLabel.textColor = UIColor.lightGray
        
        
    }
    
    
    
    
    


}
