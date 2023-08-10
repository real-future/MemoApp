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


    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
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
        cell.doneTodoTimeLabel.text = formatter.string(from: completedList[indexPath.row].doneDate) //🌟지금은 제작시점 시각 -> 나중에 버튼 눌렀을 때 완료 시각으로 변경하기
        cell.selectionStyle = .none
        print(TodoList.completeList)//확인용
        print(indexPath.row)//확인용
        cell.todo = completedList[indexPath.row]
        return cell
    }
}

