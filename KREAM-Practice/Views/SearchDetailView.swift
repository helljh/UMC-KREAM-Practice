//
//  SearchDetailView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/22/24.
//

import UIKit

class SearchDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addStack()
        addConponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let backButton = UIButton().then{
        $0.setImage(UIImage(named: "navBackImage"), for:.normal)
    }
    let searchTextField = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.font = .systemFont(ofSize: 13.5)
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(named: "F5F5F5")
        $0.layer.cornerRadius = 12
        $0.setLeftPaddingPoints(8)
    }
    
    let cancelButton = UIButton().then{
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setTitleColor(.black, for: .normal)
        
    }
    
    public lazy var searchResultsTableView = UITableView().then{
        $0.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: SearchResultsTableViewCell.identifier)
        $0.separatorStyle = .singleLine
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var searchStackView = makeStack(axis: .horizontal, spacing: 11)
    
    private func makeStack(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .fill
        return stackView
    }
    
    private func addStack(){
        [backButton, searchTextField, cancelButton].forEach{searchStackView.addArrangedSubview($0)}
    }
    
    private func addConponents(){
        addSubview(searchStackView)
        addSubview(searchResultsTableView)
    }
    
    private func constraints(){
        
        backButton.snp.makeConstraints{
            $0.width.equalTo(24)
            
        }
        
        searchTextField.snp.makeConstraints{
            $0.width.equalTo(268)
            $0.height.equalTo(39)
        }
        
        searchStackView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(7)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(22)
        }
        
        searchResultsTableView.snp.makeConstraints{
            $0.top.equalTo(searchStackView.snp.bottom).offset(31)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}
