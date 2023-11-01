//
//  BirthdayViewController.swift
//  SeSACRxThreads
//
//  Created by jack on 2023/10/30.
//
 
import UIKit
import SnapKit
import RxRelay
import RxSwift

class BirthdayViewController: UIViewController {
    
    let birthDayPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.locale = Locale(identifier: "ko-KR")
        picker.maximumDate = Date()
        return picker
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.textColor = Color.black
        label.text = "만 17세 이상만 가입 가능합니다."
        return label
    }()
    
    let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10 
        return stack
    }()
    
    let yearLabel: UILabel = {
       let label = UILabel()
        label.text = "9999년"
        label.textColor = Color.black
        label.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        return label
    }()
    
    let monthLabel: UILabel = {
       let label = UILabel()
        label.text = "33월"
        label.textColor = Color.black
        label.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        return label
    }()
    
    let dayLabel: UILabel = {
       let label = UILabel()
        label.text = "99일"
        label.textColor = Color.black
        label.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        return label
    }()
    
    let disposeBag = DisposeBag()
  
    let nextButton = PointButton(title: "가입하기")
    let birthDateRelay = BehaviorRelay<Date>(value: Date())
    let birthYear = PublishRelay<Int>()
    let birthMonth = PublishRelay<Int>()
    let birthDay = PublishRelay<Int>()
    lazy var canRegister = birthDateRelay.map { date in
        let age = Calendar.current.dateComponents([.year], from: date, to: Date()).year!
        return age >= 17
    }.asObservable()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Color.white
        
        configureLayout()
        
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        bind()
    }
    
    func bind() {
        birthDayPicker.rx.date.subscribe(with: self) { owner, value in
            owner.birthDateRelay.accept(value)
        }.disposed(by: disposeBag)
        
        birthYear.map{ "\($0)년" }.bind(to: yearLabel.rx.text).disposed(by: disposeBag)
        birthMonth.map{ "\($0)월" }.bind(to: monthLabel.rx.text).disposed(by: disposeBag)
        birthDay.map{ "\($0)일" }.bind(to: dayLabel.rx.text).disposed(by: disposeBag)
        canRegister.bind(with: self) { $0.nextButton.backgroundColor = $1 ? .black : .systemGray3 }.disposed(by: disposeBag)
        
        birthDateRelay.observe(on: MainScheduler.instance).subscribe(with: self) { owner, date in
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: date)
            
            owner.birthYear.accept(dateComponents.year!)
            owner.birthMonth.accept(dateComponents.month!)
            owner.birthDay.accept(dateComponents.day!)
        }.disposed(by: disposeBag)
    }
    
    @objc func nextButtonClicked() {
        print("가입완료")
    }

    
    func configureLayout() {
        view.addSubview(infoLabel)
        view.addSubview(containerStackView)
        view.addSubview(birthDayPicker)
        view.addSubview(nextButton)
 
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
        }
        
        containerStackView.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        [yearLabel, monthLabel, dayLabel].forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        birthDayPicker.snp.makeConstraints {
            $0.top.equalTo(containerStackView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
   
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(birthDayPicker.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}
