//
//  ViewController.swift
//  Diary
//
//  Created by JunHwan Kim on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var dateLabelList: [UILabel]!
    @IBOutlet var dateImageViewList: [UIImageView]!
    @IBOutlet var baseDateViewList: [UIView]!
    
    let dateList: [Int] = [100, 200, 300, 400]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutDatePicker()
        layoutImageView()
        for num in 0..<dateLabelList.count {
            displayDateLabel(dateLabel: dateLabelList[num], date: datePicker.date, addDay: dateList[num])
        }
    }

    func layoutDatePicker() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.tintColor = .black
    }
    
    func layoutImageView() {
        for imageView in dateImageViewList {
            imageView.layer.cornerRadius = 20.0
        }
        for baseView in baseDateViewList {
            baseView.backgroundColor = .none
            baseView.layer.shadowColor = UIColor.black.cgColor
            baseView.layer.shadowOffset = .init(width: 10.0, height: 10.0)
            baseView.layer.shadowOpacity = 0.3
            baseView.clipsToBounds = false
        }
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        for num in 0..<dateLabelList.count {
            displayDateLabel(dateLabel: dateLabelList[num], date: sender.date, addDay: dateList[num])
        }
    }
    
    func displayDateLabel(dateLabel: UILabel, date: Date, addDay: Int) {
        dateLabel.text = addDayToDateFormat(day: addDay, date: date)
        dateLabel.sizeToFit()
    }
    
    func addDayToDateFormat(day: Int, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일, YYYY년"
        let calculateDate = Calendar.current.date(byAdding: .day, value: day, to: date)!
        return dateFormatter.string(from: calculateDate)
    }
    
}

