//
//  TodoListTableViewController.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import UIKit

class TodoListTableViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //날짜 형식 커스텀
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 80
        print("# \(TodoList.list)") //확인용
    }
    
    
    //메모 추가 화면(alert view 활용)
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
        alert.addTextField {(textField:UITextField) in textField.placeholder = "20자 이내로 입력해주세요."}
        
        //취소, 저장 버튼
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        let save = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            
            //비어 있을 때에는 저장 안 됨
            if let content = alert.textFields?.first?.text, !content.isEmpty {
                let newTodo = Todo(id: (TodoList.list.last?.id ?? -1) + 1, content: content, doneDate: Date(), isCompleted: false)
                TodoList.list.append(newTodo)
                self?.tableView.reloadData()
            }
        }
        
        //버튼 생성
        alert.addAction(cancel)
        alert.addAction(save)
        
        self.present(alert, animated: true)
    }
    
    
    
    //테이블뷰 행 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.list.count
    }
    
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        print("# \(cell.doneButton.isSelected)") //확인용
        
        //홈으로 갔다가 돌아와도 화면 유지될 수 있도록
        let isSelected = TodoList.list[indexPath.row].isCompleted
        let image = isSelected == true ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        
        cell.doneButton.isSelected = isSelected
        cell.doneButton.setImage(image, for: .normal)
        cell.doneButton.configuration?.baseBackgroundColor = .white //활성화 배경 없애기
        cell.todoLabel.text = TodoList.list[indexPath.row].content
        cell.todoSubLabel.text = formatter.string(from: TodoList.list[indexPath.row].doneDate)
        cell.selectionStyle = .none
        cell.todo = TodoList.list[indexPath.row]
        
        return cell
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TodoList.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //        } else if editingStyle == .insert {
            //        }
        }
    }
}
    
    
    extension TodoListTableViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    
    
    //    func tableView(_ tableView: UITableView, editingStyleForRowAt: IndexPath) -> UITableViewCell.EditingStyle {
    //        return .delete
    //    }

