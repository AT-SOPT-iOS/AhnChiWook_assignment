//
//  MainViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//

import UIKit

class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()

    private let mainImageView = UIImageView()
    
    private let top20Data = Top20Model.dummy()
    private let Top20CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let myTop6Data = MyTop6Model.dummy()
    private let Top6CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        register()
        CVLayout()
        setDelegate()
        setHierarchy()
        setUI()
        setLayout()
    }
    
    
    private func register() {
        
        Top20CollectionView.register(Top20CollectionViewCell.self, forCellWithReuseIdentifier: Top20CollectionViewCell.reuseIdentifier)
        
        Top20CollectionView.register(Top20HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Top20HeaderView.reuseIdentifier)
        
        Top6CollectionView.register(MyTop6CollectionViewCell.self, forCellWithReuseIdentifier: MyTop6CollectionViewCell.reuseIdentifier)
        
        Top6CollectionView.register(Top6HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Top6HeaderView.reuseIdentifier)
    }
    
    private func CVLayout() {
        
        setTop20Layout()
        setTop6Layout()
    }
    
    private func setTop20Layout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 118, height: 146)
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.scrollDirection = .horizontal
        
        flowLayout.headerReferenceSize = CGSize(width: view.bounds.width, height: 23)
        
        self.Top20CollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.Top20CollectionView.backgroundColor = .black
    }
    
    private func setTop6Layout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 170, height: 100)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.scrollDirection = .horizontal
        
        flowLayout.headerReferenceSize = CGSize(width: view.bounds.width, height: 5)
        
        self.Top6CollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.Top6CollectionView.backgroundColor = .black
    }

    private func setDelegate() {
        
        Top20CollectionView.delegate = self
        Top20CollectionView.dataSource = self
        Top6CollectionView.delegate = self
        Top6CollectionView.dataSource = self
    }
    
    private func setHierarchy() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            mainImageView,
            Top20CollectionView,
            Top6CollectionView
        )
    }
    
    private func setUI() {
        
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = true
        }
        
        mainImageView.do {
            $0.image = .image19
        }
    }
    
    private func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview()
            if let img = mainImageView.image {
                let aspect = img.size.height / img.size.width
                $0.height.equalTo(mainImageView.snp.width).multipliedBy(aspect)
            } else {
                $0.height.equalTo(200)
            }
        }
        
        Top20CollectionView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            //$0.bottom.equalTo(contentView.snp.bottom).offset(-16)
            
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(200)
        }
        
        Top6CollectionView.snp.makeConstraints {
            $0.top.equalTo(Top20CollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(contentView.snp.bottom).offset(-16)
            
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(120)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

//extension MainViewController: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        return top20Data.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = Top20CollectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.reuseIdentifier, for: indexPath) as? Top20CollectionViewCell else { return UICollectionViewCell() }
//        cell.dataBind(top20Data[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
//        
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Top20HeaderView.reuseIdentifier,for: indexPath) as! Top20HeaderView
//
//        return header
//    }
//}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 컬렉션 뷰 구분
        if collectionView == Top20CollectionView {
            return top20Data.count
        } else if collectionView == Top6CollectionView { // 다른 컬렉션 뷰
            return myTop6Data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 첫 번째 컬렉션 뷰 (Top20)
        if collectionView == Top20CollectionView {
            guard let cell = Top20CollectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.reuseIdentifier, for: indexPath) as? Top20CollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(top20Data[indexPath.item])
            return cell
        }
        // 두 번째 컬렉션 뷰
        else if collectionView == Top6CollectionView {
            guard let cell = Top6CollectionView.dequeueReusableCell(withReuseIdentifier: MyTop6CollectionViewCell.reuseIdentifier, for: indexPath) as? MyTop6CollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(myTop6Data[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        // 첫 번째 컬렉션 뷰 (Top20)
        if collectionView == Top20CollectionView {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: Top20HeaderView.reuseIdentifier,
                for: indexPath) as! Top20HeaderView
            return header
        }
        // 두 번째 컬렉션 뷰
        else if collectionView == Top6CollectionView {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: Top6HeaderView.reuseIdentifier,
                for: indexPath) as! Top6HeaderView
            return header
        }
        
        return UICollectionReusableView()
    }
}
