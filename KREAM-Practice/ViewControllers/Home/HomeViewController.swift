//
//  HomeViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit
import Then

class HomeViewController: UIViewController {
    
    private var homeView = HomeView()
    private let segmentItems: [String] = ["추천","랭킹","발매정보","럭셔리","남성","여성"]
    private var previousIndexPath: IndexPath?
    private var customSegHandler: CustomSegCollectionHandler?
    private let menuCollectionHandler = MenuCollectionHandler()
    private var justDropCollectionHandler: JustDropCollectionHandler?
    private let yearEndCollectionHandler = YearEndCollectionHandler()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 네비게이션 바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 다른 뷰 컨트롤러로 넘어갈 때 네비게이션 바 다시 보이게 하기
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        homeView.backgroundColor = .white
        
        justDropCollectionHandler = JustDropCollectionHandler(viewController: self)
        customSegHandler = CustomSegCollectionHandler(homeView: self.homeView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchTextFieldTapped))
        self.homeView.searchTextField.addGestureRecognizer(tapGestureRecognizer)
        
        homeView.goToTopBtn.addTarget(self, action: #selector (goToTopBtnTapped), for: .touchUpInside)
        
        setUpDatasourceDelegate()
    }
    
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.adArea.isHidden = false
            homeView.menuCollectionView.isHidden = false
            homeView.divideLine.isHidden = false
            homeView.emptyLabel.isHidden = true
        }else{
            homeView.adArea.isHidden = true
            homeView.menuCollectionView.isHidden = true
            homeView.divideLine.isHidden = true
            homeView.emptyLabel.isHidden = false
        }
        //updateUnderlinePosition()
    }
    
    @objc private func goToTopBtnTapped(){
        homeView.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    
    
    @objc private func searchTextFieldTapped() {
        let searchVC = SearchViewController()
        
        navigationController?.pushViewController(searchVC, animated: false)
    }
    
    private func setUpDatasourceDelegate(){
        self.homeView.customSeg.dataSource = customSegHandler
        self.homeView.customSeg.delegate = customSegHandler
        customSegHandler?.setUpInitionalState()
        self.homeView.menuCollectionView.dataSource = menuCollectionHandler
        self.homeView.menuCollectionView.delegate = menuCollectionHandler
        self.homeView.justDropCollectionView.dataSource = justDropCollectionHandler
        self.homeView.justDropCollectionView.delegate = justDropCollectionHandler
        self.homeView.yearEndEssentialCollectionView.dataSource = yearEndCollectionHandler
        self.homeView.yearEndEssentialCollectionView.delegate = yearEndCollectionHandler
    }
    
}
