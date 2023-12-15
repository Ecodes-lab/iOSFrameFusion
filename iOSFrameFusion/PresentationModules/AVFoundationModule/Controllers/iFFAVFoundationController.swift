//
//  iFFAVFoundationController.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit

class iFFAVFoundationController: BaseViewController {

    let frames = [
        Frame(icon: "audio-og", title: "Audio", vc: iFFAVAudioController()),
    ]
    lazy var frameCollectionView: iFFVGridCollectionView = {
        let cv = iFFVGridCollectionView()
        cv.configure(parentViewController: self, frames: frames)
        return cv
    }()

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
