//
//  MainViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//

import UIKit

class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()

    private let mainImageView = UIImageView()
    
    private let top20Data = Top20Model.dummy()
    private let Top20CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        register()
        setTop20Layout()
        setDelegate()
        setLayout()
    }
    
    private func setTop20Layout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 118, height: 146)
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.scrollDirection = .horizontal
        
        //flowLayout.headerReferenceSize = CGSize(width: view.bounds.width, height: 23)
        
        self.Top20CollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.Top20CollectionView.backgroundColor = .black
    }
    
    private func register() {
        
        Top20CollectionView.register(Top20CollectionViewCell.self, forCellWithReuseIdentifier: Top20CollectionViewCell.reuseIdentifier)
        
//        Top20CollectionView.register(
//            Top20HeaderView.self,
//            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: Top20HeaderView.reuseIdentifier)
    }

    private func setDelegate() {
        
        Top20CollectionView.delegate = self
        Top20CollectionView.dataSource = self
    }
    
    private func setLayout() {
        
        view.addSubviews(
            scrollView
        )
        
        scrollView.addSubviews(
            mainImageView,
            Top20CollectionView
        )
        
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = true
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        mainImageView.do {
            $0.image = .image19
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            $0.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            $0.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            $0.width.equalTo(scrollView.contentLayoutGuide.snp.width)
            if let img = mainImageView.image {
                let aspect = img.size.height / img.size.width
                $0.height.equalTo(mainImageView.snp.width).multipliedBy(aspect)
            } else {
                $0.height.equalTo(200)
            }
        }
        
        Top20CollectionView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            $0.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom).offset(-16)
            
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
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
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        guard kind == UICollectionView.elementKindSectionHeader else {
//            return UICollectionReusableView()
//        }
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Top20HeaderView.reuseIdentifier, for: indexPath) as! Top20HeaderView
//        // header.titleLabel.text = "원하는 텍스트"  // 동적 변경도 가능
//        return header
//    }
}

