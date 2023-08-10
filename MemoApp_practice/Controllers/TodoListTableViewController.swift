//
//  TodoListTableViewController.swift
//  MemoApp_practice
//
//  Created by FUTURE on 2023/08/07.
//

import UIKit

class TodoListTableViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var noTodoTextLabel: UILabel!
    @IBOutlet weak var textLabel: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    
    //날짜 형식 커스텀
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "en")
        return f
    }()
    
    
    //prepare : 세그웨이가 연결된 화면을 생성하고, 화면 전환 직전에 호출됨
    //세그웨이로 연결된 화면에서 데이터 전달할 때에 대부분 이런 패턴으로 전달해
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //sender : 연결된 화면의 cell
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.todo = TodoList.list[indexPath.row]
            }
        } //source는 세그웨이 실행하는 화면, destination은 새롭게 표시되는 화면
    }
    
    
    //앱 실행되면 딱 한 번 실행되는 부분
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //메모 비어 있을 때, 메세지 띄우기
        if TodoList.list.isEmpty  {
            noTodoTextLabel.text = "There are no lists to display.\nTry adding a new task :)"
        }

        tableView.dataSource = self
        tableView.rowHeight = 80
        print("# \(TodoList.list)") //확인용
    }
    
    

    
    
    
    //메모 추가 화면(alert view 활용)
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Add a Task", message: "", preferredStyle: .alert)
        alert.addTextField {(textField:UITextField) in textField.placeholder = "Please Enter Anything"}
        
        //취소, 저장 버튼
        let cancel = UIAlertAction(title: "cancel", style: .default)
        let save = UIAlertAction(title: "save", style: .default) { [weak self] _ in
            
            //비어 있을 때에는 저장 안 됨
            if let content = alert.textFields?.first?.text, !content.isEmpty {
                let newTodo = Todo(id: (TodoList.list.last?.id ?? -1) + 1, content: content, doneDate: Date(), isCompleted: false)
                TodoList.list.append(newTodo)
                self?.tableView.reloadData()
                self?.noTodoTextLabel.text = ""
            }
        }
        
        
        
        //버튼 생성
        alert.addAction(cancel)
        alert.addAction(save)
        
        //강조 색상 커스텀
        alert.view.tintColor = UIColor.orange
        
        self.present(alert, animated: true)
    }
    
    
    
    //테이블뷰 행 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.list.count
    }
    
    
    //데이터 연결
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        print("# \(cell.doneButton.isSelected)") //확인용
        
        noTodoTextLabel.text = ""
      
        
        //홈으로 갔다가 돌아와도 화면 유지될 수 있도록
        let isSelected = TodoList.list[indexPath.row].isCompleted
        let image = isSelected == true ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        
        if isSelected {
            cell.todoLabel.textColor = UIColor.gray
            cell.todoSubLabel.textColor = UIColor.gray
        } else {
            cell.todoLabel.textColor = UIColor.black
            cell.todoSubLabel.textColor = UIColor.black
        }
        
        
        cell.doneButton.isSelected = isSelected
        cell.doneButton.setImage(image, for: .normal)
        cell.doneButton.configuration?.baseBackgroundColor = .white //활성화 배경 없애기
        cell.todoLabel.text = TodoList.list[indexPath.row].content
        cell.todoSubLabel.text = formatter.string(from: TodoList.list[indexPath.row].doneDate)
        cell.selectionStyle = .none
        cell.todo = TodoList.list[indexPath.row]

        return cell
    }
    
    

    
    //테이블뷰 행 편집할 때 써야함. UITableViewDelegate 프로토콜의 일부
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            noTodoTextLabel.text = "There are no lists to display.\nTry adding a new task :)"
            TodoList.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
    
    
    extension TodoListTableViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    
  

