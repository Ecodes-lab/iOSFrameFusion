//
//  iFFHomeViewController.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 24/11/2023.
//

import UIKit
import SnapKit

class iFFHomeViewController: BaseViewController {
    
    let frames = [
        Frame(icon: "av-foundation-og", title: "AVFoundation", vc: iFFAVFoundationController()),
    ]
    
    lazy var frameCollectionView: iFFVGridCollectionView = {
        let cv = iFFVGridCollectionView()
        cv.configure(parentViewController: self, frames: frames)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "iOS Frame Fusion"
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
