//
//  NewlyWordViewController.swift
//  BaeminUI
//
//  Created by JunHwan Kim on 2023/07/22.
//

import UIKit

class NewlyWordViewController: UIViewController {
    
    @IBOutlet weak var searchBarStackView: UIStackView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var newlyWordButtonList: [UIButton]!
    
    @IBOutlet weak var newlyWordExplanationLabel: UILabel!
    
    var currentButtonListWord: [String] = []
    let newlyWordDict: [String: String] = ["갑분싸":"갑자기 분위기가 싸해짐", "혼코노":"혼자 코인 노래방에 가다", "퇴준생":"퇴사를 준비하는 사람", "워라밸":"일과 삶의 균형", "쉼포족":"쉼을 포기한 사람", "올인빌":"집 근처에서 모든것을 해결 할 수 있는 것", "TMI":"너무 과한 정보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        replaceRandomNewlyWordListButton()
        print(view.subviews)
    }
    
    func replaceRandomNewlyWordListButton() {
        pickRandomNewlyWord()
        bindRandomNewlyWordAtButtonList()
    }
    
    func bindRandomNewlyWordAtButtonList() {
        newlyWordButtonList.forEach { button in
            button.setTitle(currentButtonListWord[button.tag], for: .normal)
        }
    }
    
    func pickRandomNewlyWord() {
        currentButtonListWord.removeAll()
        while currentButtonListWord.count < 4 {
            guard let randomWord = newlyWordDict.randomElement()?.key else { return }
            if !currentButtonListWord.contains(randomWord) {
                currentButtonListWord.append(randomWord)
            }
        }
    }
    
    func layout() {
        layoutSearchBarStackView()
        layoutNewlyWordButton()
    }
    
    func layoutSearchBarStackView() {
        searchBarStackView.layer.borderColor = UIColor.black.cgColor
        searchBarStackView.layer.borderWidth = 3.0
    }
    
    func layoutNewlyWordButton() {
        newlyWordButtonList.forEach { button in
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1.0
        }
    }
    
    @IBAction func endEditing(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func searchNewlyWord(_ sender: UIButton) {
        guard let searchTextWord = searchTextField.text, searchTextWord != "", searchTextWord.count < 1 else { showWarningAlert()
            return
        }
        searchTextField.text = ""
        displayNewWordMean(newlyWord: searchTextWord)
    }
    
    @IBAction func tapNewlyWordButton(_ sender: UIButton) {
        guard let text  = sender.titleLabel?.text else { return }
        displayNewWordMean(newlyWord: text)
        replaceRandomNewlyWordListButton()
        endEditing(sender)
    }
    
    
    func displayNewWordMean(newlyWord: String) {
        let newlyWordMean: String? = newlyWordDict[newlyWord]
        if newlyWordMean == nil {
            newlyWordExplanationLabel.text = "존재하지 않는 신조어 입니다."
            return
        }
        newlyWordExplanationLabel.text = newlyWordMean
    }
    
    func showWarningAlert() {
        let alerController = UIAlertController(title: "주의!", message: "두 글자 이상 입력해주십시오", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alerController.addAction(ok)
        present(alerController, animated: true)
    }
}
