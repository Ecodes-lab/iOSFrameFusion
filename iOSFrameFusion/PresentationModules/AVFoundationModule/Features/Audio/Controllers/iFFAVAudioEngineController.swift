//
//  iFFAVAudioEngineController.swift
//  iOSFrameFusion
//
//  Created by Eco Dev System on 15/12/2023.
//

import UIKit
import AVFoundation

class iFFAVAudioEngineController: BaseViewController {
    
    var audioFile: AVAudioFile!
    
    var audioEngine: AVAudioEngine!
    var playerNode: AVAudioPlayerNode!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.audioFile = try AVAudioFile(forReading: Bundle.main.url(forResource: "audio", withExtension: "m4a")!)
        } catch {
            print("Something happened")
        }
        
        audioEngine = AVAudioEngine()
        playerNode = AVAudioPlayerNode()

        // Attach the player node to the audio engine.
        audioEngine.attach(playerNode)


        // Connect the player node to the output node.
        audioEngine.connect(playerNode,
                            to: audioEngine.outputNode,
                            format: audioFile.processingFormat)
        
        playerNode.scheduleFile(audioFile,
                                at: nil,
                                completionCallbackType: .dataPlayedBack) { _ in
            /* Handle any work that's necessary after playback. */
            self.playerNode.stop()
            self.audioEngine.stop()
        }
        
        play()
    }
    
    func play() {
        do {
            try audioEngine.start()
            playerNode.play()
        } catch {
            /* Handle the error. */
        }
    }

}

