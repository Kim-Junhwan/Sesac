//
//  ShoppingTableViewController.swift
//  TableViewControllerTest
//
//  Created by JunHwan Kim on 2023/07/27.
//

import UIKit
import Foundation

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addTextField: UITextField!
    var list: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        guard let text = addTextField.text else { return }
        if text == "" {
            return
        }
        list.append(text)
        addTextField.text = ""
        view.endEditing(true)
        tableView.reloadData()
    }
    
    func layout() {
        layoutAddView()
    }
    
    func layoutAddView() {
        addView.layer.cornerRadius = 10.0
        addTextField.layer.borderColor = UIColor.clear.cgColor
        addTextField.borderStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        cell.layer.cornerRadius = 10.0
        return cell
    }
    
}
