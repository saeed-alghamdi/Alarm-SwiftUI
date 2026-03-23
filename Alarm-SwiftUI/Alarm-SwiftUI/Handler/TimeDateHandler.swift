//
//  TimeDateHandler.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import Foundation


func getTime() -> String {
    let format = DateFormatter()
    format.dateFormat = "h:mm a"
    return format.string(from: Date())
}

func getSnoozeTime(snoozeDate: Date) -> String {
    
    let format = DateFormatter()
    format.dateFormat = "h:mm a"
    return format.string(from: snoozeDate)
    
}
