//
//  TodoTableViewCell.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import UIKit//commit
print("미래ㄴㅇㅁㄴㅇㄹㅁㄴㄹㅁㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㄴㅁㅇㄹ")
print("미래ㄴㅇㅁㄴㅇㄹㅁㄴㄹㅁㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㄴㅁㅇㄹ")
print("미래ㄴㅇㅁㄴㅇㄹㅁㄴㄹㅁㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㄴㅁㅇㄹ")
print("미래ㄴㅇㅁㄴㅇㄹㅁㄴㄹㅁㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㄴㅁㅇㄹ")


class TodoTableViewCell: UITableViewCell {
  
    
    var todo: Todo?
    

    
    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var todoSubLabel: UILabel!
    
    @IBAction func pressedButton(_ sender: Any) {
//        guard let todo else { return }
//        if mainButton.isTouchInside {
//            todoLabel.textColor = .gray
//            mainButton.
//
//
        }
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
