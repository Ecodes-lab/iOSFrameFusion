//
//  iFFVCollectionView.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit

class iFFVCollectionView: BaseView {

    var items: [Item]!
    var parentViewController: UIViewController!

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = ColorManager.bg
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    func configure(parentViewController: UIViewController, items: [Item]) {
        self.parentViewController = parentViewController
        self.items = items
    }
    
    override func commonInit() {
        super.commonInit()
        
        collectionView.register(iFFVCollectionCell.self, forCellWithReuseIdentifier: K.CellIndentifiers.vCollectionCell)
    }
    
    override func layout() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self)
        }
    }
    
}

extension iFFVCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = items[indexPath.row].vc
        parentViewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension iFFVCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIndentifiers.vCollectionCell, for: indexPath) as! iFFVCollectionCell
        cell.configure(item: items[indexPath.row])
        return cell
    }
}

extension iFFVCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Section insets (distance from boundary )
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // get the Collection View width and height
        let collectionViewWidth = collectionView.frame.width
        let collectionViewHeight =  collectionView.frame.width
        // calculate Cell width and height
        let cellWidth = (collectionViewWidth - 40 ) / 3
        let cellHeight = cellWidth
        
        return CGSize(width: collectionView.frame.width, height: 20)
        
    }
}
