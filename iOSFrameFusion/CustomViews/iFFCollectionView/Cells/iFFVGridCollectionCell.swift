//
//  iFFVGridCollectionCell.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit

class iFFVGridCollectionCell: BaseCell {
    
    private var icon = UIImageView()
    private var title = UILabel()
    
    private var stackView = UIStackView()

    override func setupViews() {
        super.setupViews()
    }
    
    override func style() {
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        
        icon.contentMode = .scaleAspectFill
        
        title.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    
    override func layout() {
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(title)
        addSubview(stackView)
//        addSubview(icon)
//        addSubview(title)
        
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottomMargin.equalTo(30)
        }
        
        icon.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(150)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(-20)
        }
    }
}

extension iFFVGridCollectionCell {
    func configure(frame: Frame) {
        icon.image = UIImage(named: frame.icon)
        title.text = frame.title
    }
}
