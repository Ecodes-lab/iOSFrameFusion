//
//  iFFVCollectionCell.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit

class iFFVCollectionCell: BaseCell {
    
    private var icon = UIImageView()
    private var title = UILabel()
    
    private var stackView = UIStackView()

    override func setupViews() {
        super.setupViews()
    }
    
    override func style() {
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        
//        icon.contentMode = .scaleAspectFill
        title.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    override func layout() {
//        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(title)
        addSubview(stackView)
//        addSubview(icon)
//        addSubview(title)
        
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.trailing.equalTo(self).offset(10)
//            make.bottomMargin.equalTo(30)
        }
        
//        icon.snp.makeConstraints { make in
//            make.width.equalToSuperview()
//            make.height.equalTo(150)
//        }
        
//        title.snp.makeConstraints { make in
//            make.top.equalTo(icon.snp.bottom)
//        }
    }
}

extension iFFVCollectionCell {
    func configure(item: Item) {
//        icon.image = UIImage(named: item.icon)
        title.text = item.title
    }
}
