//
//  BaseCell.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 24/11/2023.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        style()
        layout()
    }
    
    func style() {}
    
    func layout() {}
}
