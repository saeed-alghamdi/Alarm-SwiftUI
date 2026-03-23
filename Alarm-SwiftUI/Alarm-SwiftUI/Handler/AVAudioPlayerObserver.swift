//
//  AVAudioPlayerObserver.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 16/09/1447 AH.
//

import Foundation
import AVFoundation


class AVAudioPlayerObserver: ObservableObject {
    
    var player: AVAudioPlayer?
    
    func playAudioFromAVPlayer() {
        
        let url = Bundle.main.url(forResource: "morning_flower", withExtension: "mp3")
        
        print("the url of the sound is: \(url!)")
        
        print("the sound must be initialized")
        player?.numberOfLoops = false ? -1 : 0
        player?.prepareToPlay()
        player?.play()
        print("this code must be running")
        print("is that code running: \(player?.isPlaying)")
        
    }
    
    func stopAudio() {
        
        player?.stop()
        
    }
    
}
