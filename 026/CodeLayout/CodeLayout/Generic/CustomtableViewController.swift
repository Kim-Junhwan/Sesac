//
//  CustomtableViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/24.
//

import UIKit
import SnapKit

class CustomtableViewController: UIViewController {
    
    let tableView: UITableView = {
       let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        return view
    }()
    
    var isExpand = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
    }

}

extension CustomtableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = "텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀텍스트 셀"
        cell.textLabel?.numberOfLines = isExpand ? 0 : 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isExpand.toggle()
        tableView.reloadData()
    }
}
