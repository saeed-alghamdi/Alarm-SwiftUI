//
//  RingtoneAlarmPickerObservation.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 23/09/1447 AH.
//

import Foundation


class ChosenRingtone: ObservableObject {
    
    @Published var chosenRingtoneName: String = ""
    @Published var pickedRingtone: Bool = false
    
}
