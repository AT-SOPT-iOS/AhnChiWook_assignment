//
//  MainViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//

import UIKit

class MainViewController: UIViewController {

    private let top20Data = Top20Model.dummy()
    private let Top20CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setTop20Layout()
        register()
        setDelegate()
        setLayout()
    }
    
    private func setTop20Layout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 160, height: 146)
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.scrollDirection = .horizontal
        
        self.Top20CollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.Top20CollectionView.backgroundColor = .systemBlue
    }
    
    private func register() {
        
        Top20CollectionView.register(Top20CollectionViewCell.self, forCellWithReuseIdentifier: Top20CollectionViewCell.reuseIdentifier)
    }

    private func setDelegate() {
        
        Top20CollectionView.delegate = self
        Top20CollectionView.dataSource = self
    }
    
    private func setLayout() {
        
        view.addSubviews(
            Top20CollectionView
        )
        
        Top20CollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(2)
            //$0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(180)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return top20Data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = Top20CollectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.reuseIdentifier, for: indexPath) as? Top20CollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(top20Data[indexPath.item])
        return cell
    }
}


extension MainViewController: UICollectionViewCompositionalLayout {
    
}
