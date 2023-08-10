//
//  DetailViewController.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/10.
//

import UIKit

class DetailViewController: UIViewController {

    //TodoListTableViewController에서 전달한 메모
    var todo: Todo?
    
    
    let formatter: DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = todo?.content
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell.textLabel?.text = formatter.string(for: todo?.doneDate)
            
            return cell
            
        default:
            fatalError() //빈셀을 리턴한다면
            
        }
    }
    
    
}
