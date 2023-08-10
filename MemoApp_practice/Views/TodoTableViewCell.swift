//
//  TodoTableViewCell.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import UIKit


class TodoTableViewCell: UITableViewCell {
    
    var todo: Todo?
    
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var todoSubLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            }
    
    
    //버튼 눌렀을 때마다 UI변경, 할 일 속성도 변경
    @IBAction func pressedButton(_ sender: Any) {
        
        guard let todo = todo else { return }
        
        if doneButton.isSelected  {
            doneButton.setImage(UIImage(systemName: "circle"), for: .normal)
            todoLabel.textColor = UIColor.black
            todoSubLabel.textColor = UIColor.black
            doneButton.isSelected = false
            TodoList.completeTodo(todo: todo, isComplete: false)
            print(TodoList.list,"isSelcted는",doneButton.isSelected)
                
        } else {
            doneButton.configuration?.baseBackgroundColor = .white //배경색 활성화 없애는 것
            doneButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            todoLabel.textColor = UIColor.lightGray
            todoSubLabel.textColor = UIColor.lightGray
            doneButton.isSelected = true
            TodoList.completeTodo(todo: todo, isComplete: true)
            print(TodoList.list,"isSelcted는",doneButton.isSelected)
        }
    }
}
