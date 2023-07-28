//
//  CustomTableViewCell.swift
//  CustomCellTableView
//
//  Created by JunHwan Kim on 2023/07/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomTableViewCell"
    
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var todoDetailLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    func configureCell(toDo: ToDo) {
        todoLabel.text = toDo.main
        todoDetailLabel.text = toDo.sub
        checkBoxButton.isSelected = toDo.done
        starButton.isSelected = toDo.like
        setCheckButton()
        setStarButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemGray5
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    @IBAction func tapCheckBoxButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        setCheckButton()
    }
    
    @IBAction func tapStarButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        setStarButton()
    }
    
    func setCheckButton() {
        checkBoxButton.isSelected ? checkBoxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal) : checkBoxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    
    func setStarButton() {
        starButton.isSelected ? starButton.setImage(UIImage(systemName: "star"), for: .normal) : starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
}
