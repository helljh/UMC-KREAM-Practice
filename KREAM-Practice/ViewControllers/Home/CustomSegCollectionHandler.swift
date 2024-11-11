//
//  CustomSeg.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/11/24.
//

import UIKit

class CustomSegCollectionHandler: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private var homeView: HomeView?
    private let segmentItems: [String] = ["추천","랭킹","발매정보","럭셔리","남성","여성"]
    private var previousIndexPath: IndexPath?
    
    init(homeView: HomeView) {
        self.homeView = homeView
        
    }
    
    func setUpInitionalState() {
        //초기 셀 선택 및 밑줄 설정
        DispatchQueue.main.async {
            let initialIndexPath = IndexPath(item: 0, section: 0)
            self.collectionView(self.homeView!.customSeg, didSelectItemAt: initialIndexPath)
            self.homeView!.customSeg.selectItem(at: initialIndexPath, animated: false, scrollPosition: [])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return segmentItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomSegCollectionViewCell.identifier, for: indexPath) as? CustomSegCollectionViewCell else { return UICollectionViewCell() }
        
        cell.titleLabel.text = segmentItems[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
        let cellFrameInSuperview = collectionView.convert(cell.frame, to: self.homeView)
        
        // 밑줄을 셀의 하단에 맞추어 위치시킵니다.
        UIView.animate(withDuration: 0.3) {
        self.homeView!.underlineView.frame = CGRect(x: cellFrameInSuperview.origin.x, y: cellFrameInSuperview.maxY, width: cell.frame.width, height: 2)
            self.homeView!.underlineView.isHidden = false
        }
        // 이전 선택 경로 업데이트
        previousIndexPath = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = segmentItems[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: 19)
    }
}
