//
//  BaseView.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 24/11/2023.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    func commonInit() {
        style()
        layout()
    }
    
    func style() {}
    
    func layout() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
