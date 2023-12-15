//
//  iFFVGridCollectionView.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit
import SnapKit

class iFFVGridCollectionView: BaseView {
    
    var frames: [Frame]!
    var parentViewController: UIViewController!

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = ColorManager.bg
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    func configure(parentViewController: UIViewController, frames: [Frame]) {
        self.parentViewController = parentViewController
        self.frames = frames
    }
    
    override func commonInit() {
        super.commonInit()
        
        collectionView.register(iFFVGridCollectionCell.self, forCellWithReuseIdentifier: K.CellIndentifiers.frameCollectionCell)
    }
    
    override func layout() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self)
        }
    }
    
}

extension iFFVGridCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = frames[indexPath.row].vc
        parentViewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension iFFVGridCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIndentifiers.frameCollectionCell, for: indexPath) as! iFFVGridCollectionCell
        cell.configure(frame: frames[indexPath.row])
        return cell
    }
}

extension iFFVGridCollectionView: UICollectionViewDelegateFlowLayout {
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
        
        return CGSize(width: cellWidth , height: cellHeight)
        
    }
}
