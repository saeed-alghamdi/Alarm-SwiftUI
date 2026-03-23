//
//  Alarm_SwiftUIApp.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 11/04/1446 AH.
//

import SwiftUI

// THAT'S HOW TO GET THE APP FACE NAME
/*
 
 let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
 // Or, for the technical name
 let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String
 Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
 
 */

@main
struct Alarm_SwiftUIApp: App {
    
    let themeNumber = UserDefaults.standard.integer(forKey: "themeNumber")
    
    var body: some Scene {
        WindowGroup {
            switch themeNumber {
            case 0:
                DefaultThemeAlarmView()
            case 1:
                BlackRedAlarmView()
            case 2:
                WhiteBlueAlarmView()
            case 3:
                YellowBlackAlarmView()
            case 4:
                BlueOrangeAlarmView()
            case 5:
                PinkWhiteAlarmView()
            case 6:
                WhiteMintAlarmView()
            default:
                AlarmView()
            }
        }
    }
}
