////
////  TodoCompleteViewController.swift
////  MemoApp_practice
////
////  Created by FUTURE on 2023/08/07.
////
//
import UIKit


class TodoCompleteViewController: UIViewController {
    
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    
    @IBOutlet weak var noDoneLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    //prepare : 세그웨이가 연결된 화면을 생성하고, 화면 전환 직전에 호출됨
    //세그웨이로 연결된 화면에서 데이터 전달할 때에 대부분 이런 패턴으로 전달해
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //sender : 연결된 화면의 cell
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DoneDetailViewController {
                vc.todo = TodoList.completeList[indexPath.row]
            }
        } //source는 세그웨이 실행하는 화면, destination은 새롭게 표시되는 화면
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //비어 있을 때 안내 문구 나오도록
        if TodoList.completeList.isEmpty {
            noDoneLabel.text = Names.greetingText.noDoneList
        } else {
            noDoneLabel.text = Names.greetingText.yesDoneList
        }
        
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    //테이블뷰 행 편집할 때 써야함. UITableViewDelegate 프로토콜의 일부
    //삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // 삭제 알림창을 보여주는 코드
            let deleteAlert = UIAlertController(title: Names.deleteAlert.title, message: Names.deleteAlert.message, preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "cancel", style: .default)
            let delete = UIAlertAction(title: "delete", style: .default) { _ in
                TodoList.list.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                
                // 이 부분에서 TodoList의 길이를 확인하고, 안내 메세지 띄우기
                if TodoList.list.isEmpty {
                    self.noDoneLabel.text = Names.greetingText.noDoneList
                } else {
                    self.noDoneLabel.text = Names.greetingText.yesDoneList
                }
            }
        
            deleteAlert.addAction(cancel)
            deleteAlert.addAction(delete)
            
            //강조 색상 커스텀
            deleteAlert.view.tintColor = UIColor.orange
            self.present(deleteAlert, animated: true, completion: nil)
        }
    }
    
}



extension TodoCompleteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoCompleteViewController: UITableViewDataSource {
    //완료 할 일 행 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.completeList.count
    }
    
    
    
    //완료 할 일 데이터 연결
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let completedList = TodoList.completeList
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TodoCompleteTableViewCell
        cell.doneTodoLabel.text = completedList[indexPath.row].content
        cell.doneTodoTimeLabel.text = formatter.string(from: completedList[indexPath.row].doneDate)
        cell.selectionStyle = .none
        print(TodoList.completeList)//확인용
        print(indexPath.row)//확인용
        cell.todo = completedList[indexPath.row]
        return cell
    }
}


