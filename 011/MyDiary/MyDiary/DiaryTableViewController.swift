//
//  DiaryTableViewController.swift
//  MyDiary
//
//  Created by JunHwan Kim on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var list: [String] = ["123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123","456456456456456456456456456456456456456456456456","789789789789789789789789789789789789789789789789789789"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: DiaryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DiaryTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        setBackgroundColor()
        tableView.backgroundColor = .green
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell", for: indexPath) as? DiaryTableViewCell else { return DiaryTableViewCell() }
        cell.contentLabel.text = list[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.navigationItem.title = "상세정보"
        presentViewController(vc: vc)
    }
    
    @IBAction func addBarButtonClicked(_ sender: UIBarButtonItem?) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        presentViewController(vc: vc)
    }
    
    @IBAction func tapSearchBarButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        presentViewController(vc: vc)
    }
    
    
    func presentViewController(vc: UIViewController) {
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .automatic
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
