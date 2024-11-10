//
//  HomeViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit
import Then

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let segmentItems: [String] = ["추천","랭킹","발매정보","럭셔리","남성","여성"]
    private var previousIndexPath: IndexPath?
    let segmentedControl = CustomSegCollectionHandler()
    
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
        
//        homeView.segmentedControl.layer.borderWidth = 1
//        homeView.segmentedControl.layer.borderColor = UIColor.black.cgColor
//        setupCollectionView(homeView.customSeg, tag: 1, dataSource: self)
        homeView.customSeg.dataSource = segmentedControl
        homeView.customSeg.delegate = segmentedControl
        setupCollectionView(homeView.menuCollectionView, tag: 2, dataSource: self)
        setupCollectionView(homeView.justDropCollectionView, tag: 3, dataSource: self)
        setupCollectionView(homeView.yearEndEssentialCollectionView, tag: 4, dataSource: self)
//        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchTextFieldTapped))
        self.homeView.searchTextField.addGestureRecognizer(tapGestureRecognizer)
        
        //초기 셀 선택 및 밑줄 설정
        DispatchQueue.main.async {
            let initialIndexPath = IndexPath(item: 0, section: 0)
            self.collectionView(self.homeView.customSeg, didSelectItemAt: initialIndexPath)
            self.homeView.customSeg.selectItem(at: initialIndexPath, animated: false, scrollPosition: [])
        }
        
        homeView.goToTopBtn.addTarget(self, action: #selector (goToTopBtnTapped), for: .touchUpInside)
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
    
    private func setupCollectionView(_ collectionView: UICollectionView, tag: Int, dataSource: UICollectionViewDataSource?) {
        if(tag == 1){
            collectionView.dataSource = dataSource
            collectionView.delegate = self
            collectionView.tag = tag
        }else{
            collectionView.dataSource = dataSource
            collectionView.tag = tag
        }
    }
    
    @objc private func searchTextFieldTapped() {
        let searchVC = SearchViewController()
        
        navigationController?.pushViewController(searchVC, animated: false)
    }
    
}

//MARK: - UICollection으로 UISegmentedControl 구현
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 1:
            return segmentItems.count
        case 2:
            return HomeMenu.dummy().count
        case 3:
            return JustDropMenu.dummy().count
        case 4:
            return YearEndEssentialModel.dummy().count
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomSegCollectionViewCell.identifier, for: indexPath) as? CustomSegCollectionViewCell else { return UICollectionViewCell() }
            
            cell.titleLabel.text = segmentItems[indexPath.row]
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else { return UICollectionViewCell() }
            
            let list = HomeMenu.dummy()
            
            cell.imageButton.setImage(list[indexPath.row].image, for: .normal)
            cell.titleLabel.text = list[indexPath.row].title
            
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDropCollectionViewCell.identifier, for: indexPath) as? JustDropCollectionViewCell else { return UICollectionViewCell() }
            
            let list = JustDropMenu.dummy()
            let tabCell = UITapGestureRecognizer(target: self, action: #selector(goToDetailPage))
            
            let tabSaveBtn = UITapGestureRecognizer(target: self, action: #selector (goToDetailPage))
            
            
            cell.addGestureRecognizer(tabCell)
            
            cell.imageButton.setImage(list[indexPath.row].image, for: .normal)
            cell.imageButton.backgroundColor = list[indexPath.row].bgColor
//            cell.imageButton.addTarget(self, action: #selector (goToDetailPage), for: .touchUpInside)
            cell.saveButton.addGestureRecognizer(tabSaveBtn)
            cell.tradeAmountLabel.text = "거래 " + String(list[indexPath.row].tradeAmount) + "만"
            cell.brandLabel.text = list[indexPath.row].brand
            cell.nameLabel.text = list[indexPath.row].name
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            if let formattedPrice = formatter.string(from: NSNumber(value: list[indexPath.row].price)){
                cell.priceLabel.text = "\(formattedPrice)원"
            }else{
                cell.priceLabel.text = "가격 정보 없음"
            }
            
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YearEndEssentialCollectionViewCell.identifier, for: indexPath) as? YearEndEssentialCollectionViewCell else { return UICollectionViewCell() }
            
            let list = YearEndEssentialModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.idLabel.text = list[indexPath.row].id
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag{
        case 1:
            
            // 해당 셀을 찾습니다.
            //guard let cell = collectionView.cellForItem(at: indexPath) else { return }
            // 이전 선택된 셀의 스타일을 변경
            if let previousIndexPath = previousIndexPath, let previousCell = collectionView.cellForItem(at: previousIndexPath) as? CustomSegCollectionViewCell {
                previousCell.setSelected(false)
            }
            
            // 새로 선택된 셀의 스타일을 변경
            guard let cell = collectionView.cellForItem(at: indexPath) as? CustomSegCollectionViewCell else { return }
            cell.setSelected(true)
            
            //cell.isHighlighted = true
            // 셀의 프레임을 collectionView의 좌표계에서 view의 좌표계로 변환합니다.
            let cellFrameInSuperview = collectionView.convert(cell.frame, to: self.view)
            
            // 밑줄을 셀의 하단에 맞추어 위치시킵니다.
            UIView.animate(withDuration: 0.3) {
                self.homeView.underlineView.frame = CGRect(x: cellFrameInSuperview.origin.x, y: cellFrameInSuperview.maxY, width: cell.frame.width, height: 2)
                self.homeView.underlineView.isHidden = false
            }
            // 이전 선택 경로 업데이트
            previousIndexPath = indexPath
        case 2:
            print("menu selected")
        case 3:
            print("DroppedItem selected")
        default:
            break
        }
    }
    
    @objc func goToDetailPage(){
        let vc = ItemDetailViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: false)
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            let label = UILabel(frame: CGRect.zero)
            label.text = segmentItems[indexPath.item]
            label.sizeToFit()
            return CGSize(width: label.frame.width, height: 19)
        default:
            print("error")
        }
        return CGSize(width: 0, height: 0)
    }
}



//    private func updateUnderlinePosition() {
//        homeView.underlineView.backgroundColor = .black
//        let segment = homeView.segmentedControl
//        let segmentIndex = CGFloat(segment.selectedSegmentIndex)
//        let segmentWidth = segment.bounds.size.width / CGFloat(segment.numberOfSegments)
//        let leadingDistance = segmentWidth * segmentIndex
//
//    // 아래는 0.3초의 시간 동안 view의 애니메이션을 주면서 밑줄의 constraints를 업데이트 해준다
//        UIView.animate(withDuration: 0.3, animations: {
////            self.homeView.underlineView.frame = CGRect(
////                        x: leadingDistance,
////                        y: segment.frame.maxY - 2,  // 세그먼트의 바닥에서 밑줄의 위치
////                        width: segmentWidth,
////                        height: 2
////                    )
//            self.homeView.underlineView.snp.updateConstraints {
//                $0.bottom.equalTo(segment.snp.bottom)
//                $0.left.equalTo(segment).inset(leadingDistance)
//                $0.height.equalTo(2)
//            }
//            //self.homeView.segmentedControl.layoutIfNeeded()
//        })
//    }


//extension HomeViewController: UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return HomeMenu.dummy().count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else { return UICollectionViewCell() }
//        let list = HomeMenu.dummy()
//
//        cell.imageButton.setImage(list[indexPath.row].image, for: .normal)
//        cell.titleLabel.text = list[indexPath.row].title
//
//        return cell
//    }
//
//
//}
