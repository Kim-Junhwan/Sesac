//
//  ViewController.swift
//  DiffableTest
//
//  Created by JunHwan Kim on 2023/09/18.
//

import UIKit

enum Section: Int {
    case modeSetting
    case playMode
    
    func description() -> String? {
        switch self {
        case .modeSetting:
            return "모드 설정"
        case .playMode:
            return nil
        }
    }
    func secondaryDescription() -> String {
        switch self {
        case .modeSetting:
            return "집중 모드에서는 경고 및 알림 소리가 울리지 않습니다."
        case .playMode:
            return "이 기기에서 집중모드를 켜면 사용자의 다른 기기에서도 집중모드가 켜집니다."
        }
    }
}

enum ItemType {
    case noInterference
    case sleep
    case work
    case personalTime
    case share
}

struct Item: Hashable {
    let title: String
    let subTitle: String?
    let statusTitle: String?
    let type: ItemType
    let identifier: UUID
    let image: UIImage?
    let imageColor: UIColor?
    init(title: String, subTitle: String?, statusTitle: String?, type: ItemType, image: UIImage?, imageColor: UIColor?) {
        self.title = title
        self.subTitle = subTitle
        self.statusTitle = statusTitle
        self.type = type
        self.identifier = UUID()
        self.image = image
        self.imageColor = imageColor
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
}

class ConfigurationViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        return tableView
    }()
    var dataSource: SettingDataSource!
    var currentSnapshot : NSDiffableDataSourceSnapshot<Section, Item>!
    
    static let reuseIdentifier = "reuse-identifier"
    
    let optionList: [Item] = [
        .init(title: "방해 금지 모드", subTitle: nil, statusTitle: "켬", type: .noInterference, image: .init(systemName: "moon.fill")?, imageColor: .purple),
        .init(title: "수면", subTitle: nil, statusTitle: nil, type: .sleep, image: .init(systemName: "bed.double.fill")?, imageColor: .orange),
        .init(title: "업무", subTitle: "09:00 ~ 06:00", statusTitle: nil, type: .work, image: .init(systemName: "iphone")?, imageColor: .green),
        .init(title: "개인시간", subTitle: nil, statusTitle: "설정", type: .personalTime, image: .init(systemName: "person.fill")?, imageColor: .blue)
    ]
    
    let modeList: [Item] = [.init(title: "모든 기기에서 공유", subTitle: nil, statusTitle:  nil, type: .share, image: nil, imageColor: nil)]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatasource()
        configureView()
        updateUI()
    }

    func configureView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ConfigurationViewController.reuseIdentifier)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    func configureDatasource() {
        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationViewController.reuseIdentifier, for: indexPath)
            var content: UIListContentConfiguration
            switch itemIdentifier.type {
            case .noInterference, .personalTime, .sleep:
                content = .valueCell()
                content.secondaryText = itemIdentifier.statusTitle
                cell.accessoryType = .disclosureIndicator
            case .work:
                content = .subtitleCell()
                content.secondaryText = itemIdentifier.subTitle
                cell.accessoryType = .disclosureIndicator
            case .share:
                let enableWifiSwitch = UISwitch()
                enableWifiSwitch.isOn = true
                content = .valueCell()
                cell.accessoryView = enableWifiSwitch
                break
            }
            content.text = itemIdentifier.title
            content.textProperties.font = .systemFont(ofSize: 13)
            content.secondaryTextProperties.font = .systemFont(ofSize: 13)
            content.image = itemIdentifier.image
            content.imageProperties.tintColor = itemIdentifier.imageColor
            cell.contentConfiguration = content
            return cell
        })
        
        
    }
    
    func updateUI() {
        currentSnapshot = .init()
        currentSnapshot.appendSections([.modeSetting, .playMode])
        currentSnapshot.appendItems(optionList, toSection: .modeSetting)
        currentSnapshot.appendItems(modeList, toSection: .playMode)
        dataSource.apply(currentSnapshot)
    }
    
}

