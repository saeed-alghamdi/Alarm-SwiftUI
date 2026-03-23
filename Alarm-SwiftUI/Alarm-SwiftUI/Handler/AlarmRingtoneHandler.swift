//
//  AlarmRingtoneHandler.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 20/09/1447 AH.
//

import Foundation
import AudioToolbox

struct RingtoneName: Identifiable {
    
    let id: UUID = UUID()
    let name: String
    var isPlay: Bool = false
    
}


struct AlarmRingtoneHandler {
    
    static var clickSoundId: SystemSoundID = 0
    static var alarmSoundId: SystemSoundID = 1
    
    
    static func getAllRingtones() -> [RingtoneName] {
        
        var allRingtones: [RingtoneName] = []
        
        // get sounds by urls
        //let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil)
        
        // get sounds by paths
        let paths = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        
        for path in paths {
            let spliting = path.split(separator: "/")
            let lastElement = spliting.last!
            let lastElementString = String(lastElement)
            
            // igonre add click* to the ringtones
            if lastElementString.starts(with: "click") {
                continue
            }
            let ringtoneName = RingtoneName(name: lastElementString)
            allRingtones.append(ringtoneName)
        }
        
        return allRingtones.sorted { e1, e2 in
            return e1.name < e2.name
        }
        
    }
    
    static func loadSoundEffect(nameOf ringtone: String, soundOf soundID: UnsafeMutablePointer<SystemSoundID>) {
        
        if let path = Bundle.main.path(forResource: ringtone, ofType: nil) {
            
            let fileURL = URL(fileURLWithPath: path, isDirectory: false)
            
            
            let error = AudioServicesCreateSystemSoundID(fileURL as CFURL, soundID)
            
            if error != kAudioServicesNoError {
                print("Error code \(error) loading sound: \(path)")
            }
        }
    }
    
    
    static func playSoundAlarm(soundOf soundID: SystemSoundID) {
        
        // loop the alarm sound without using AVFoundation and observableobject
        // isn't that cool 🤣
        if soundID == alarmSoundId {
            
            // loopoing for 7 times
            AudioServicesPlayAlertSoundWithCompletion(soundID, {
                AudioServicesPlayAlertSoundWithCompletion(soundID) {
                    AudioServicesPlayAlertSoundWithCompletion(soundID) {
                        AudioServicesPlayAlertSoundWithCompletion(soundID) {
                            AudioServicesPlayAlertSoundWithCompletion(soundID) {
                                AudioServicesPlayAlertSoundWithCompletion(soundID) {
                                    AudioServicesPlayAlertSound(soundID)
                                }
                            }
                        }
                    }
                }
            })
            
            
        } else {
            
            AudioServicesPlayAlertSound(soundID)
            
        }
        
    }
    
    
    static func stopSoundAlarm(soundOf soundID: SystemSoundID) {
        
        AudioServicesDisposeSystemSoundID(soundID)
        
    }
    
}
