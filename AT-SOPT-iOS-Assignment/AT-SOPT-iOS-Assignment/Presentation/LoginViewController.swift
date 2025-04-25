//
//  LoginViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 4/22/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .gray1
        label.textAlignment = .center
        label.font = .pretendard(.regular, size: 23)
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.setPlaceholderColor(.gray2)
        textField.layer.cornerRadius = 2
        textField.addLeftPadding()
        textField.clearButtonMode = .whileEditing
        textField.textColor = .gray2
        textField.font = .pretendard(.regular, size: 15)
        textField.backgroundColor = .gray4
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(canLogin), for: .editingChanged)
        return textField
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setImage(.clear, for: .normal)
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.setImage(.eyeSlash, for: .normal)
        button.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let subRightView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.setPlaceholderColor(.gray2)
        textField.layer.cornerRadius = 2
        textField.addLeftPadding()
        textField.rightView = subRightView
        textField.rightViewMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.textColor = .gray2
        textField.font = .pretendard(.regular, size: 15)
        textField.backgroundColor = .gray4
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(canLogin), for: .editingChanged)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray4
        button.titleLabel?.font = .pretendard(.regular, size: 14)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .pretendard(.regular, size: 14)
        return button
    }()
    
    private let findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .pretendard(.regular, size: 14)
        return button
    }()
    
    private var sectionBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let noAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("아직 계정이 없으신가요?", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .pretendard(.regular, size: 14)
        return button
    }()
    
    private let setNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .pretendard(.regular, size: 14)
        button.setUnderline()
        return button
    }()
    
    @objc
    private func loginButtonDidTapped() {
        pushToWelcome()
    }
    
    private func pushToWelcome() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = idTextField.text
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUI()
        setLayout()
        canLogin()
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc
    private func canLogin() {
        // 두 텍스트 필드가 모두 비어있지 않은지 확인
        let isIdValid = (idTextField.text?.isEmpty == false)
        let isPasswordValid = (passwordTextField.text?.isEmpty == false)
        let canLogin = isIdValid && isPasswordValid
        
        // 버튼 상태 업데이트
        loginButton.isEnabled = canLogin
        
        // 버튼 색상 업데이트
        loginButton.backgroundColor = canLogin ? .tvingRed : .gray4
    }
    
    @objc
    private func clearButtonTapped() {
        passwordTextField.text = nil
    }
    
    @objc
    private func secureButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
    }

    private func setUI() {
        
        view.addSubviews(
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            sectionBar,
            findIdButton,
            findPasswordButton,
            noAccountButton,
            setNicknameButton
        )
        subRightView.addSubviews(
            secureButton,
            clearButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(46)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        findIdButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalTo(sectionBar.snp.leading).offset(-33)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalTo(sectionBar.snp.trailing).offset(36)
        }
        
        sectionBar.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        noAccountButton.snp.makeConstraints {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(58)
        }
        
        setNicknameButton.snp.makeConstraints {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.leading.equalTo(noAccountButton.snp.trailing).offset(41)
        }
        
        clearButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        secureButton.snp.makeConstraints {
            $0.trailing.equalTo(clearButton.snp.leading).offset(-16)
            $0.size.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        subRightView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(76)
        }
        
    }

}

//#Preview{
//    LoginViewController()
//}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.layer.borderWidth = 1
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}
