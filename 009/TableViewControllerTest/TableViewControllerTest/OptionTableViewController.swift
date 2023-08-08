//
//  OptionTableViewController.swift
//  TableViewControllerTest
//
//  Created by JunHwan Kim on 2023/07/27.
//

import UIKit

class OptionTableViewController: UITableViewController {
    
    enum Section: Int, CaseIterable {
        case allSetting = 0
        case personalSetting
        case extra
        
        var sectionTitle: String {
            switch self {
            case .allSetting:
                return "전체 설정"
            case .personalSetting:
                return "개인 설정"
            case .extra:
                return "기타"
            }
        }
        
        func getSectionMenuList() -> [String] {
            switch self {
            case .allSetting:
                return ["공지사항","실험실","버전 정보"]
            case .personalSetting:
                return ["개인/보안","알림","채팅","멀티프로필"]
            case .extra:
                return ["고객센터/도움말"]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(rawValue: section)?.sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentSection = Section(rawValue: section) else { return 0 }
        return currentSection.getSectionMenuList().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        guard let currentSection = Section(rawValue: indexPath.section) else { return UITableViewCell() }
        cell.textLabel?.text = currentSection.getSectionMenuList()[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
