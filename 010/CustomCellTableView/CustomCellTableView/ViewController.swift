//
//  ViewController.swift
//  CustomCellTableView
//
//  Created by JunHwan Kim on 2023/07/28.
//

import UIKit

class ViewController: UITableViewController {
    
    var todo = ToDoInformation()
    var sublist = ["오늘까지","내일","주말"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 106.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return CustomTableViewCell() }
        cell.configureCell(toDo: todo.list[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}

