//
//  SettingDataSource.swift
//  DiffableTest
//
//  Created by JunHwan Kim on 2023/09/18.
//

import Foundation
import UIKit

class SettingDataSource: UITableViewDiffableDataSource<Section, Item> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionKind = Section(rawValue: section)
        return sectionKind?.description()
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let sectionKind = Section(rawValue: section)
        return sectionKind?.secondaryDescription()
    }
}
