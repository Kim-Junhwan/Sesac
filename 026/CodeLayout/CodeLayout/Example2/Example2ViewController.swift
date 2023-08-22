//
//  Example2ViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/22.
//

import UIKit

class Example2ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "doughnut")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let topRightButtonsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    let presentButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.image = UIImage(systemName: "pencil.tip.crop.circle")
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let optionButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.image = UIImage(systemName: "gearshape.circle")
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let infoButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.image = UIImage(systemName: "figure.wave.circle")
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let topStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    let xButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.image = UIImage(systemName: "xmark")
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let profileStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "macaroon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "고양이"
        return label
    }()
    
    let overViewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "귀여워"
        return label
    }()
    
    let kakaoActionButtonStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.distribution = .fill
         stackView.alignment = .center
         stackView.axis = .horizontal
         stackView.spacing = 10
         return stackView
    }()
    
    let meChattingButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.image = UIImage(systemName: "figure.wave.circle")
        buttonConfiguration.title = "나와의 채팅"
        buttonConfiguration.imagePlacement = .top
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editProfileButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.image = UIImage(systemName: "figure.wave.circle")
        buttonConfiguration.title = "프로필 편집"
        buttonConfiguration.imagePlacement = .top
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kakaoStoryButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.image = UIImage(systemName: "figure.wave.circle")
        buttonConfiguration.title = "카카오스토리"
        buttonConfiguration.imagePlacement = .top
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let splitView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        setTopView()
        setActionButton()
        setUserProfileView()
    }
    
    func setBackGround() {
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setTopView() {
        view.addSubview(topStackView)
        for button in [presentButton, optionButton, infoButton] {
            topRightButtonsStackView.addArrangedSubview(button)
        }
        topStackView.addArrangedSubview(xButton)
        topStackView.addArrangedSubview(topRightButtonsStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func setUserProfileView() {
        view.addSubview(profileStackView)
        for subView in [userImageView, nameLabel, overViewLabel] {
            profileStackView.addArrangedSubview(subView)
        }
        NSLayoutConstraint.activate([
            profileStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileStackView.bottomAnchor.constraint(equalTo: splitView.topAnchor, constant: -30),
            userImageView.widthAnchor.constraint(equalToConstant: 200),
            userImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func setActionButton() {
        view.addSubview(splitView)
        view.addSubview(kakaoActionButtonStackView)
        for subView in [meChattingButton, editProfileButton, kakaoStoryButton] {
            kakaoActionButtonStackView.addArrangedSubview(subView)
        }
        NSLayoutConstraint.activate([
            splitView.bottomAnchor.constraint(equalTo: kakaoActionButtonStackView.topAnchor, constant: -20),
            splitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splitView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splitView.heightAnchor.constraint(equalToConstant: 2.0),
            kakaoActionButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            kakaoActionButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
