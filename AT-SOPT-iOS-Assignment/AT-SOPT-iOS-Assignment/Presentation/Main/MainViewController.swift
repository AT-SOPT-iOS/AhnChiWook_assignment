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
    
    private let segmentControl = UISegmentedControl()
    
    private let tvingImage = UIImageView()
    
    private let searchButton = UIButton()
    
    private let profileIcon = UIImageView()

    private let mainImageView = UIImageView()
    
    private let top20Label = UILabel()
    private let top20Data = Top20Model.dummy()
    private let Top20CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let liveLabel = UILabel()
    private let liveData = LiveModel.dummy()
    private let LiveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let popMovieLabel = UILabel()
    private let popMovieData = PopularMovieModel.dummy()
    private let PopMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let kboData = KBOModel.dummy()
    private let KBOCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let myLeagueData = LeagueModel.dummy()
    private let LeagueCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let top6Label = UILabel()
    private let myTop6Data = MyTop6Model.dummy()
    private let Top6CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        CVLayout()
        setDelegate()
        register()
        setUI()
        setLayout()
    }
    
    
    private func register() {
        Top20CollectionView.register(Top20CollectionViewCell.self, forCellWithReuseIdentifier: Top20CollectionViewCell.reuseIdentifier)
        LiveCollectionView.register(LiveCollectionViewCell.self, forCellWithReuseIdentifier: LiveCollectionViewCell.reuseIdentifier)
        PopMovieCollectionView.register(PopularMovieCollectionViewCell.self, forCellWithReuseIdentifier: PopularMovieCollectionViewCell.reuseIdentifier)
        KBOCollectionView.register(KBOCollectionViewCell.self, forCellWithReuseIdentifier: KBOCollectionViewCell.reuseIdentifier)
        LeagueCollectionView.register(LeagueCollectionViewCell.self, forCellWithReuseIdentifier: LeagueCollectionViewCell.reuseIdentifier)
        Top6CollectionView.register(MyTop6CollectionViewCell.self, forCellWithReuseIdentifier: MyTop6CollectionViewCell.reuseIdentifier)
    }
    
    private func CVLayout() {
        setTop20Layout()
        setLiveLayout()
        setPopMovieLayout()
        setKBOLayout()
        setLeagueLayout()
        setTop6Layout()
    }
    
    private func setTop20Layout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 128, height: 146)
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.scrollDirection = .horizontal
        self.Top20CollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.Top20CollectionView.backgroundColor = .black
    }
    
    private func setLiveLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 170, height: 140)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.scrollDirection = .horizontal
        self.LiveCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.LiveCollectionView.backgroundColor = .black
    }
    
    private func setPopMovieLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 98, height: 146)
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.scrollDirection = .horizontal
        self.PopMovieCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.PopMovieCollectionView.backgroundColor = .black
    }
    
    private func setKBOLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 80, height: 50)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        self.KBOCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.KBOCollectionView.backgroundColor = .black
    }
    
    private func setLeagueLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 50)
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.scrollDirection = .horizontal
        self.LeagueCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.LeagueCollectionView.backgroundColor = .black
    }
    
    private func setTop6Layout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 170, height: 100)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.scrollDirection = .horizontal
        self.Top6CollectionView.setCollectionViewLayout(flowLayout, animated: false)
        self.Top6CollectionView.backgroundColor = .black
    }

    private func setDelegate() {
        Top20CollectionView.delegate = self
        Top20CollectionView.dataSource = self
        LiveCollectionView.delegate = self
        LiveCollectionView.dataSource = self
        PopMovieCollectionView.delegate = self
        PopMovieCollectionView.dataSource = self
        KBOCollectionView.delegate = self
        KBOCollectionView.dataSource = self
        LeagueCollectionView.delegate = self
        LeagueCollectionView.dataSource = self
        Top6CollectionView.delegate = self
        Top6CollectionView.dataSource = self
    }
    
    private func setHierarchy() {
        view.addSubviews(scrollView, segmentControl)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            tvingImage,
            searchButton,
            profileIcon,
            mainImageView,
            Top20CollectionView,
            top20Label,
            LiveCollectionView,
            liveLabel,
            PopMovieCollectionView,
            popMovieLabel,
            KBOCollectionView,
            LeagueCollectionView,
            Top6CollectionView,
            top6Label
        )
    }
    
    private func setUI() {
        
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = true
        }
        
        segmentControl.do {
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.pretendard(.regular, size: 17)
            ], for: .normal)
           
            $0.backgroundColor = .black
            $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            $0.selectedSegmentTintColor = .clear
            $0.insertSegment(withTitle: "홈", at: 0, animated: true)
            $0.insertSegment(withTitle: "드라마", at: 1, animated: true)
            $0.insertSegment(withTitle: "예능", at: 2, animated: true)
            $0.insertSegment(withTitle: "영화", at: 3, animated: true)
            $0.insertSegment(withTitle: "스포츠", at: 4, animated: true)
            $0.insertSegment(withTitle: "뉴스", at: 5, animated: true)
            $0.selectedSegmentIndex = 0
        }
        
        tvingImage.do {
            $0.image = .tving2
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
            $0.backgroundColor = .clear
        }
        
        profileIcon.do {
            $0.image = .profile
        }
        
        mainImageView.do {
            $0.image = .image19
        }
        
        top20Label.do {
            $0.text = "오늘의 티빙 TOP 20"
            $0.font = .pretendard(.bold, size: 15)
            $0.textColor = .white
        }
        
        liveLabel.do {
            $0.text = "실시간 인기 LIVE"
            $0.font = .pretendard(.bold, size: 15)
            $0.textColor = .white
        }
        
        popMovieLabel.do {
            $0.text = "실시간 인기 영화"
            $0.font = .pretendard(.bold, size: 15)
            $0.textColor = .white
        }
        
        top6Label.do {
            $0.text = "안치욱PD의 인생작 TOP 6"
            $0.font = .pretendard(.bold, size: 15)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(35)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        tvingImage.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.equalToSuperview()
        }
        
        profileIcon.snp.makeConstraints {
            $0.centerY.equalTo(tvingImage.snp.centerY)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(tvingImage.snp.centerY)
            $0.trailing.equalTo(profileIcon.snp.leading).offset(-10)
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(tvingImage.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            if let img = mainImageView.image {
                let aspect = img.size.height / img.size.width
                $0.height.equalTo(mainImageView.snp.width).multipliedBy(aspect)
            } else {
                $0.height.equalTo(500)
            }
        }
        
        top20Label.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        Top20CollectionView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(200)
        }
        
        liveLabel.snp.makeConstraints {
            $0.top.equalTo(Top20CollectionView.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        LiveCollectionView.snp.makeConstraints {
            $0.top.equalTo(liveLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(140)
        }
        
        popMovieLabel.snp.makeConstraints {
            $0.top.equalTo(LiveCollectionView.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        PopMovieCollectionView.snp.makeConstraints {
            $0.top.equalTo(popMovieLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(146)
        }
        
        KBOCollectionView.snp.makeConstraints {
            $0.top.equalTo(PopMovieCollectionView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(50)
        }
        
        LeagueCollectionView.snp.makeConstraints {
            $0.top.equalTo(KBOCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(90)
        }

        top6Label.snp.makeConstraints {
            $0.top.equalTo(LeagueCollectionView.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
        }
        
        Top6CollectionView.snp.makeConstraints {
            $0.top.equalTo(top6Label.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(contentView.snp.bottom).offset(-16)
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(120)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 컬렉션 뷰 구분
        if collectionView == Top20CollectionView {
            return top20Data.count
        }
        else if collectionView == LiveCollectionView {
            return liveData.count
        }
        else if collectionView == PopMovieCollectionView {
            return popMovieData.count
        }
        else if collectionView == KBOCollectionView {
            return kboData.count
        }
        else if collectionView == LeagueCollectionView {
            return myLeagueData.count
        }
        else if collectionView == Top6CollectionView {
            return myTop6Data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == Top20CollectionView {
            guard let cell = Top20CollectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.reuseIdentifier, for: indexPath) as? Top20CollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(top20Data[indexPath.item])
            return cell
        }
        else if collectionView == LiveCollectionView {
            guard let cell = LiveCollectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell.reuseIdentifier, for: indexPath) as? LiveCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(liveData[indexPath.item])
            return cell
        }
        else if collectionView == PopMovieCollectionView {
            guard let cell = PopMovieCollectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.reuseIdentifier, for: indexPath) as? PopularMovieCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(popMovieData[indexPath.item])
            return cell
        }
        else if collectionView == KBOCollectionView {
            guard let cell = KBOCollectionView.dequeueReusableCell(withReuseIdentifier: KBOCollectionViewCell.reuseIdentifier, for: indexPath) as? KBOCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(kboData[indexPath.item])
            if kboData[indexPath.item].number % 2 == 1 {
                cell.backgroundColor = .white
            }
            else {
                cell.backgroundColor = .black
            }
            return cell
        }
        else if collectionView == LeagueCollectionView {
            guard let cell = LeagueCollectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.reuseIdentifier, for: indexPath) as? LeagueCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(myLeagueData[indexPath.item])
            return cell
        }
        else if collectionView == Top6CollectionView {
            guard let cell = Top6CollectionView.dequeueReusableCell(withReuseIdentifier: MyTop6CollectionViewCell.reuseIdentifier, for: indexPath) as? MyTop6CollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(myTop6Data[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
extension UIImage {
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(cgImage: img.cgImage!)
    }
}
