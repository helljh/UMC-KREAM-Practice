//
//  HomeView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class HomeView: UIView{
    lazy var scrollView = UIScrollView(frame: self.bounds).then{
        
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    let searchTextField = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.font = .systemFont(ofSize: 13.5)
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(named: "F5F5F5")
        $0.layer.cornerRadius = 12
        $0.setLeftPaddingPoints(8)
    }
    
    let alarmButton = UIButton().then{
        $0.setImage(UIImage(named: "alarm"), for: .normal)
    }
    var customSeg = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 23
        $0.scrollDirection = .horizontal
    }).then{
        $0.isScrollEnabled = true
        $0.backgroundColor = .clear
        $0.register(CustomSegCollectionViewCell.self, forCellWithReuseIdentifier: CustomSegCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //var segmentedControl = CustomSegmentedControl(items: ["추천","랭킹","발매정보","럭셔리","남성","여성"])
    
    var underlineView = UIView().then{
        $0.backgroundColor = .black
        //$0.isHidden = true
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let adArea = UIImageView().then{
        $0.image = UIImage(named: "home_ad")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = CGSize(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
    }).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let divideLine = UIView().then{
        $0.backgroundColor = UIColor(named: "F2F2F2")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let divideLine2 = UIView().then{
        $0.backgroundColor = UIColor(named: "F2F2F2")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let emptyLabel = UILabel().then{
        $0.text = "빈 화면"
        $0.textColor = .black
        $0.isHidden = true
    }
    
    let justDropTitle = UILabel().then{
        $0.text = "Just Dropped"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    let justDropSubTitle = UILabel().then{
        $0.text = "발매 상품"
        $0.textColor = UIColor(named: "878787")
        $0.font = .systemFont(ofSize: 13, weight: .regular)
    }
    
    let justDropCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = CGSize(width: 142, height: 237)
        $0.minimumLineSpacing = 8
        $0.scrollDirection = .horizontal
    }).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(JustDropCollectionViewCell.self, forCellWithReuseIdentifier: JustDropCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let yearEndTitle = UILabel().then{
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    let yearEndSubTitle = UILabel().then{
        $0.text = "#해피홀리룩챌린지"
        $0.textColor = UIColor(named: "878787")
        $0.font = .systemFont(ofSize: 13, weight: .regular)
    }
    
    let yearEndEssentialCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = CGSize(width: 124, height: 165)
        $0.minimumLineSpacing = 8
        $0.scrollDirection = .horizontal
    }).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(YearEndEssentialCollectionViewCell.self, forCellWithReuseIdentifier: YearEndEssentialCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews(){
        addSubview(searchTextField)
        addSubview(alarmButton)
        addSubview(customSeg)
        addSubview(scrollView)
        //addSubview(segmentedControl)
//        addSubview(adArea)
//        addSubview(menuCollectionView)
//        addSubview(divideLine)
//        addSubview(emptyLabel)
        addSubview(underlineView)
        
       
        let justDropStackView = UIStackView(arrangedSubviews: [justDropTitle, UILabel().then{
            $0.heightAnchor.constraint(equalToConstant: 4).isActive = true
        },justDropSubTitle, UILabel().then{
            $0.heightAnchor.constraint(equalToConstant: 14).isActive = true
        },justDropCollectionView])
        justDropStackView.axis = .vertical
        
        let yearEndStackView = UIStackView(arrangedSubviews: [yearEndTitle, UILabel().then{
            $0.heightAnchor.constraint(equalToConstant: 4).isActive = true
        }, yearEndSubTitle, UILabel().then{
            $0.heightAnchor.constraint(equalToConstant: 14).isActive = true
        }, yearEndEssentialCollectionView])
        yearEndStackView.axis = .vertical
    
        
        let homeContentStackView = UIStackView(arrangedSubviews: [adArea, menuCollectionView, divideLine, justDropStackView, divideLine2, yearEndStackView])
        homeContentStackView.axis = .vertical
        homeContentStackView.spacing = 30
        homeContentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(homeContentStackView)
        
        
        
        
        homeContentStackView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        scrollView.snp.makeConstraints{
            $0.top.equalTo(customSeg.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
            $0.width.equalTo(self.snp.width)
        }
        
        searchTextField.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        alarmButton.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.top).offset(8)
            $0.left.equalTo(searchTextField.snp.right).offset(15)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
//        segmentedControl.snp.makeConstraints{
//            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
//            $0.horizontalEdges.equalToSuperview()
//            //$0.width.equalTo(325)
//            $0.height.equalTo(27)
//        }
        
        customSeg.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(25)
            //$0.width.equalTo(325)
            $0.height.equalTo(27)
        }
        
        
        
//        underlineView.snp.makeConstraints{
//            $0.bottom.equalTo(segmentedControl.snp.bottom)
//            $0.left.equalTo(segmentedControl.snp.left)
//            $0.height.equalTo(2)
//            $0.width.equalTo(segmentedControl.snp.width).dividedBy(segmentedControl.numberOfSegments)
//        }
        
        adArea.snp.makeConstraints{
            $0.top.equalTo(homeContentStackView.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
            //$0.bottom.equalTo(menuCollectionView.snp.top).offset(20)
        }
        
        menuCollectionView.snp.makeConstraints{
            //$0.top.equalTo(adArea.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(182)
            //$0.bottom.equalTo(divideLine.snp.top).inset(30)
        }
        
        divideLine.snp.makeConstraints{
            //$0.top.equalTo(menuCollectionView.snp.bottom).inset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            //$0.bottom.equalTo(JustDropCollectionView.snp.top).inset(20)
        }
        
        justDropStackView.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        justDropCollectionView.snp.makeConstraints{
            $0.height.equalTo(237)
        }
        
        divideLine2.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        yearEndStackView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        yearEndEssentialCollectionView.snp.makeConstraints{
            $0.height.equalTo(165)
        }
        
        
        
//        emptyLabel.snp.makeConstraints{
//            $0.center.equalToSuperview()
//            
//        }
        
        
//        underlineView.snp.makeConstraints{
//            $0.top.equalTo(segme.snp.bottom)
//            $0.left.equalTo(customSeg.snp.left)
//            $0.height.equalTo(2)
//            
//        }
        
        
    }
    
}
