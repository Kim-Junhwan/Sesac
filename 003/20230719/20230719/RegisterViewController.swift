//
//  RegisterViewController.swift
//  20230718
//
//  Created by JunHwan Kim on 2023/07/19.
//

import UIKit

class RegisterViewController: UIViewController {
    
    enum AlertString: String {
        case ok = "확인"
    }
    
    enum ButtonString: String {
        case registerButton = "회원가입"
    }
    
    enum FailRegisterAlertString: String {
        case title = "실패"
        case message = "조건에 맞지 않습니다. 이메일과 비밀번호가 모두 입력되었는지 확인하시고 추천인 코드가 입력된 경우 숫자만 입력되었는지 확인해주십시오."
    }
    
    enum Metric {
        static let textFieldCorderRadius: Double = 10.0
        static let passwordNumberLimit: Int = 5
    }
    
    enum PlaceholderString: String {
        case commend = "추천 코드 입력"
        case email = "이메일주소 또는 전화번호"
        case location = "위치"
        case nickName = "닉네임"
        case password = "비밀번호"
    }
    
    enum SuccessRegisterAlertString: String {
        case title = "성공"
        case message = "회원가입에 성공했습니다."
    }

    @IBOutlet weak var commendTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var moreInfoCheckSwitch: UISwitch!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet var registerTextFieldList: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutMoreInfoSwitch()
        layoutRegisterButton()
        setTextField()
    }
    
    // MARK: - Layout
    
    func layoutMoreInfoSwitch() {
        moreInfoCheckSwitch.setOn(false, animated: true)
        moreInfoCheckSwitch.onTintColor = .red
        moreInfoCheckSwitch.thumbTintColor = .white
    }
    
    func layoutTextField(textField: UITextField) {
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
    }
    
    func layoutTextFieldCommonStyle() {
        for textField in registerTextFieldList {
            layoutTextField(textField: textField)
        }
    }
    
    func layoutRegisterButton() {
        registerButton.setTitle(ButtonString.registerButton.rawValue, for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = Metric.textFieldCorderRadius
    }
    
    // MARK: - Set Atrribute
    
    func setPasswordTextFieldAttribute() {
        passwordTextField.isSecureTextEntry = true
    }
    
    func setTextField() {
        layoutTextFieldCommonStyle()
        setPasswordTextFieldAttribute()
        setTextFieldPlaceHolder()
    }
    
    func setTextFieldPlaceHolder() {
        emailTextField.placeholder = PlaceholderString.email.rawValue
        passwordTextField.placeholder = PlaceholderString.password.rawValue
        nickNameTextField.placeholder = PlaceholderString.nickName.rawValue
        locationTextField.placeholder = PlaceholderString.location.rawValue
        commendTextField.placeholder = PlaceholderString.commend.rawValue
    }
    
    // MARK: - Action
    
    @IBAction func tapRegisterButton(_ sender: UIButton) {
        showAlert(registerStatus: checkCanRegist())
        view.endEditing(true)
    }
    
    @IBAction func tapRootView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func showAlert(registerStatus: Bool) {
        let alertTitle = registerStatus ? SuccessRegisterAlertString.title.rawValue : FailRegisterAlertString.title.rawValue
        let alertMessagge = registerStatus ? SuccessRegisterAlertString.message.rawValue : FailRegisterAlertString.message.rawValue
        let alertController = UIAlertController(title: alertTitle, message: alertMessagge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertString.ok.rawValue, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Register Logic
    /* 가입 조건은 이메일, 비밀번호는 반드시 입력
     비밀번호는 6자리 이상, 추천인코드 입력시 숫자만 있어야 함*/
    func checkCanRegist() -> Bool {
        return checkEmailTextFieldCondition() && checkPasswordTextFieldCondition() && checkCommendTextFieldCondition()
    }
    
    func checkCharacterIsNumber(character: Character) -> Bool {
        if !character.isNumber {
            return false
        }
        return true
    }
    
    func checkCommendTextFieldCondition() -> Bool {
        guard let commendText = commendTextField.text else { return false }
        for char in commendText {
            return checkCharacterIsNumber(character: char)
        }
        return true
    }
    
    func checkEmailTextFieldCondition() -> Bool {
        guard let emailText = emailTextField.text else { return false }
        if emailText.isEmpty {
            return false
        }
        return true
    }
    
    func checkPasswordTextFieldCondition() -> Bool {
        guard let passwordText = passwordTextField.text else { return false }
        if passwordText.isEmpty || passwordText.count <= Metric.passwordNumberLimit {
            return false
        }
        return true
    }
    
}
