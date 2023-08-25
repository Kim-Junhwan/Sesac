//
//  Example1ViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/22.
//

import UIKit
import Photos

class Example1ViewController: UIViewController {
    
    let picker = UIImagePickerController()
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    let titleTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "제목을 입력해주세요"
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()
    
    let dateTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "날짜를 입력해주세요"
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()
    
    let textView: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        view.addSubview(stackView)
        for view in [photoImageView, titleTextField, dateTextField, textView] {
            stackView.addArrangedSubview(view)
        }
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: 250),
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension Example1ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
}
