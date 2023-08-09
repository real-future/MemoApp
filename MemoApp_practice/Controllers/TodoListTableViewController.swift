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


    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
        
        alert.addTextField {(textField:UITextField) in textField.placeholder = "20자 이내로 입력해주세요."}
        
        let save = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            
            if let content = alert.textFields?.first?.text, !content.isEmpty {
                
                
                let newTodo = Todo(id: (TodoList.list.last?.id ?? -1) + 1, content: content, doneDate: Date(), isCompleted: false)
                TodoList.list.append(newTodo)
                self?.tableView?.insertRows(at: [IndexPath(row: TodoList.list.count-1, section: 0)], with: .automatic)
                print(TodoList.list)
            }
        }
        
        
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        
        alert.addAction(cancel)
        alert.addAction(save)
      
        
        self.present(alert, animated: true)
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
        cell.todoSubLabel.text = formatter.string(from: TodoList.list[indexPath.row].doneDate)
        cell.selectionStyle = .none
        cell.todo = TodoList.list[indexPath.row]
        
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
    
            TodoList.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    
    
}


    


extension TodoListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
