//
//  iFFAVAudioController.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit

class iFFAVAudioController: BaseViewController {

    let items = [
        Item(icon: "audio-og", title: "Audio Engine", vc: iFFAVAudioEngineController()),
    ]
    lazy var frameCollectionView: iFFVCollectionView = {
        let cv = iFFVCollectionView()
        cv.configure(parentViewController: self, items: items)
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
