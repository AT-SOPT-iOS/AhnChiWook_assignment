//
//  WelcomeViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 4/22/25.
//

import UIKit
import SnapKit
import Then

class WelcomeViewController: UIViewController {

    var id: String?
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = .tving
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .pretendard(.semiBold, size: 23)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .tvingRed
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var movieButton = UIButton().then {
        $0.setTitle("실시간 영화 정보", for: .normal)
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .tvingRed
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(movieButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func mainButtonTapped() {
        let mainVC = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc private func movieButtonTapped() {
        let movieVC = MovieViewController()
        self.navigationController?.pushViewController(movieVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        guard let id else { return }
        welcomeLabel.text = "\(id) 님 \n반가워요!"
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    private func setUI() {
        view.addSubviews(
            imageView,
            welcomeLabel,
            mainButton,
            movieButton
        )
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(211)
        }
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        mainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        movieButton.snp.makeConstraints {
            $0.bottom.equalTo(mainButton.snp.top).offset(-30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
