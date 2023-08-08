//
//  TodoListTableViewController.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import UIKit

class TodoListTableViewController: UIViewController, UITableViewDataSource {

    
    
    let formatter: DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 80
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TodoList.list.count
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        
        
        cell.todoLabel.text = TodoList.list[indexPath.row].content
        cell.todoSubLabel.text = formatter.string(from: TodoList.list[indexPath.row].insertDate)
        cell.selectionStyle = .none
        
        return cell
    }

}
