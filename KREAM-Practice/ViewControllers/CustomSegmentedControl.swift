//
//  SegmentedController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/12/24.
//

import UIKit
import SnapKit


class CustomSegmentedControl: UISegmentedControl {
    
    private var underlineView: UIView = UIView()
    var items: [String]?
    
    init(items: [String]) {
        super.init(items: items)
        self.items = items
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.removeBackgroundAndDivider()
    }

    private func removeBackgroundAndDivider() {
        self.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        self.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        self.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        self.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.selectedSegmentIndex = 0
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    
}
