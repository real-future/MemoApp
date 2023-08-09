//
//  TodoCompleteTableViewCell.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/09.
//

import UIKit




class TodoCompleteTableViewCell: UITableViewCell {

    
    var todo: Todo?

    
    
    
    @IBOutlet weak var doneTodoLabel: UILabel!
    @IBOutlet weak var doneTodoTimeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
