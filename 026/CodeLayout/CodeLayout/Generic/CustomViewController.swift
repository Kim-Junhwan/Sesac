//
//  CustomViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    
    let titleTextField: BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "제목을 입력해주세요"
        return view
    }()
    
    let idTextField: BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "id을 입력해주세요"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleTextField)
        view.addSubview(idTextField)
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().offset(100)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp_bottomMargin)
            make.leading.trailing.equalToSuperview().offset(100)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
