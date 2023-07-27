//
//  TestTableViewController.swift
//  TableViewControllerTest
//
//  Created by JunHwan Kim on 2023/07/27.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    var list = ["장보기","영화보기","잠자기","코드보기"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        list.append(inputTextField.text ?? "")
        inputTextField.text = ""
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier") else { return UITableViewCell()
            
        }
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55.0
    }
    
}
