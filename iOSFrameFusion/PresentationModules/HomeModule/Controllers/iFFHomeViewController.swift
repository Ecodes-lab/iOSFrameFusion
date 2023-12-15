//
//  iFFHomeViewController.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 24/11/2023.
//

import UIKit
import SnapKit

class iFFHomeViewController: BaseViewController {
    
    let frameCollectionView = FrameCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func style() {
        
    }
    
    override func layout() {
        view.addSubview(frameCollectionView)
        
        frameCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

}
