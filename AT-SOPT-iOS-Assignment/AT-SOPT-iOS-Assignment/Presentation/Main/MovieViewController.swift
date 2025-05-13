//
//  MovieViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/9/25.
//

import UIKit
import SnapKit
import Then

class MovieViewController: UIViewController {
    
    private lazy var dateTextField = UITextField().then {
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 8
        $0.addLeftPadding()
        $0.placeholder = "Ex) 2013년 10월 12일"
        $0.setPlaceholderColor(.gray2)
        $0.inputView = self.datePicker
        $0.textColor = .white
    }
    
    private let datePicker = UIDatePicker().then {
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .wheels
        $0.locale = Locale(identifier: "ko-KR")
        $0.maximumDate = .now
    }
    
    private let imageView = UIImageView().then {
        $0.image = ._201508171755545954
    }
    
    private lazy var searchButton = UIButton().then {
        $0.setTitle("검색", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
    }
    
    private let descLabel = UILabel().then {
        $0.text = "의 박스오피스~!"
        $0.font = .pretendard(.medium, size: 25)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setLayout()
        view.backgroundColor = .white
    }
    
    @objc private func tapCancel() {
        dateTextField.resignFirstResponder()
    }
    @objc private func tapDone() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let dateString = formatter.string(from: datePicker.date)
        dateTextField.text = dateString
        dateTextField.resignFirstResponder()
    }
    
    @objc private func didTapSearch() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: datePicker.date)
        let resultVC = SearchResultViewController(dateString: dateString)
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    private func setToolBar() {
        let SCwidth = view.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: SCwidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(tapDone))
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        dateTextField.inputAccessoryView = toolBar
    }
    
    private func setHierarchy() {
        view.addSubviews(dateTextField, searchButton, descLabel, imageView)
    }

    private func setLayout() {
        dateTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.height.equalTo(45)
            $0.leading.equalToSuperview().inset(35)
            $0.trailing.equalToSuperview().inset(195)
        }
        searchButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-55)
            $0.height.equalTo(45)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
        descLabel.snp.makeConstraints {
            $0.leading.equalTo(dateTextField.snp.trailing).offset(3)
            $0.centerY.equalTo(dateTextField.snp.centerY)
            $0.height.equalTo(45)
            $0.trailing.equalToSuperview().inset(5)
        }
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(15)
        }
        
        setToolBar()
    }
}

