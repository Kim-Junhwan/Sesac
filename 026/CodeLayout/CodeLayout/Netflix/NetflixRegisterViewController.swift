//
//  NetflixRegisterViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/25.
//

import UIKit

class NetflixRegisterViewController: UIViewController {
    
    let logo: UILabel = {
        let label = UILabel()
        label.text = "NETFLIX"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        return stackView
    }()
    
    let emailTextField: DefaultTextField = {
       let textField = DefaultTextField()
        textField.config(placeHolderTitle: "이메일 주소 또는 전화번호")
        return textField
    }()
    
    let passwordTextField: DefaultTextField = {
       let textField = DefaultTextField()
        textField.config(placeHolderTitle: "비밀번호")
        return textField
    }()
    
    let nicknameTextField: DefaultTextField = {
       let textField = DefaultTextField()
        textField.config(placeHolderTitle: "닉네임")
        return textField
    }()
    
    let locationTextField: DefaultTextField = {
       let textField = DefaultTextField()
        textField.config(placeHolderTitle: "위치")
        return textField
    }()
    
    let recommendTextField: DefaultTextField = {
       let textField = DefaultTextField()
        textField.config(placeHolderTitle: "추천 코드 입력")
        return textField
    }()
    
    let registerButton: DefaultButton = {
       let button = DefaultButton()
        button.setConfig(image: nil, text: "회원가입")
        return button
    }()
    
    let moreInfoStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
         return stackView
    }()
    
    let moreInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.onTintColor = .red
        
        return toggleSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setRegisterView()
        setLogo()
        setSwitch()
    }
    
    func setLogo() {
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(30)
        }
    }
    
    func setRegisterView() {
        view.addSubview(mainStackView)
        for subview in [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendTextField] {
            mainStackView.addArrangedSubview(subview)
            subview.snp.makeConstraints { make in
                make.height.equalTo(35)
            }
        }
        mainStackView.addArrangedSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        mainStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    func setSwitch() {
        view.addSubview(moreInfoStackView)
        moreInfoStackView.addArrangedSubview(moreInfoLabel)
        moreInfoStackView.addArrangedSubview(toggleSwitch)
        moreInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(10)
            make.width.equalTo(mainStackView).multipliedBy(1.0)
            make.leading.trailing.equalTo(mainStackView)
        }
    }
}
