//
//  NetflixViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixHomeViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "어벤져스엔드게임")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let logoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        return stackView
    }()
    
    let logo: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.text = "N"
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        return label
    }()
    
    let tvProgram: DefaultLabel = {
       let label = DefaultLabel()
        label.text = "TV프로그램"
        return label
    }()
    
    let movie: DefaultLabel = {
        let label = DefaultLabel()
         label.text = "영화"
         return label
     }()
    
    let zzym: DefaultLabel = {
        let label = DefaultLabel()
         label.text = "내가 찜한 콘텐츠"
         return label
     }()
    
    let advanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let advanceLabel: DefaultLabel = {
        let label = DefaultLabel()
        label.text = "미리보기"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    let frozenImageView: DefaultImageView = {
        let imageView = DefaultImageView(frame: .zero)
        imageView.image = UIImage(named: "겨울왕국")
        return imageView
    }()
    
    let avartarImageView: DefaultImageView = {
        let imageView = DefaultImageView(frame: .zero)
        imageView.image = UIImage(named: "아바타")
        return imageView
    }()
    
    let veterangImageView: DefaultImageView = {
        let imageView = DefaultImageView(frame: .zero)
        imageView.image = UIImage(named: "베테랑")
        return imageView
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    let meButton: DefaultButton = {
        let button = DefaultButton()
        button.setConfig(image: UIImage(systemName: "checkmark")!, text: "내가 찜한 컨텐츠")
        return button
    }()
    
    let infoButton: DefaultButton = {
        let button = DefaultButton()
        button.setConfig(image: UIImage(systemName: "info.circle")!, text: "정보")
        return button
    }()
    
    let playButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.title = "재생"
        config.image = UIImage(systemName: "play.fill")
       let button = UIButton(configuration: config)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundView()
        setAdvanceView()
        setButtonImageView()
        setMenu()
    }
    
    func setMenu() {
        view.addSubview(logoStackView)
        logoStackView.addArrangedSubview(logo)
        logoStackView.addArrangedSubview(menuStackView)
        for subviews in [tvProgram, movie, zzym] {
            menuStackView.addArrangedSubview(subviews)
        }
        logoStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.leading.equalTo(view.snp_leadingMargin).offset(10)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-30)
            
        }
    }
    
    func setBackgroundView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setButtonImageView() {
        view.addSubview(buttonStackView)
        for subview in [meButton, playButton, infoButton] {
            buttonStackView.addArrangedSubview(subview)
        }
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(advanceStackView.snp_topMargin).offset(-20)
        }
    }
    
    func setAdvanceView() {
        view.addSubview(advanceStackView)
        for subView in [advanceLabel, imageStackView] {
            advanceStackView.addArrangedSubview(subView)
        }
        advanceStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp_bottomMargin)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        imageStackView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        for subView in [frozenImageView, avartarImageView, veterangImageView] {
            imageStackView.addArrangedSubview(subView)
            subView.snp.makeConstraints { make in
                make.height.equalTo(subView.snp.width).multipliedBy(1.0)
            }
        }
    }
}
