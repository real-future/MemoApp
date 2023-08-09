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
        // Do any additional setup after loading the view.
    }
}

extension TodoCompleteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoCompleteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.list.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TodoCompleteTableViewCell
        cell.doneTodoLabel.text = TodoList.list[indexPath.row].content
        cell.doneTodoTimeLabel.text = formatter.string(from: TodoList.list[indexPath.row].doneDate) //🌟버튼 눌렀을 때 완료 시각으로
        cell.selectionStyle = .none
        cell.todo = TodoList.completeList()[indexPath.row]

        return cell
    }
}

