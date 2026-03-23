//
//  AlarmView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 11/04/1446 AH.
//

import SwiftUI



struct AlarmView: View {
    
    
    @State var currentTime = Time(hour: 0 , minute: 0 , second: 0)
    @State var receiver = Timer.publish(every: 1, on: .current, in:.default).autoconnect()
   
    @State var myCurrentTime = ""
    @State var currentAmPm = ""
    
    @State var showingAlarmPicker: Bool = false
    @State var currentDate: Date = .now
    
    @State var isSetAlarm = false
    @State var alarmTime = ""
    
    @State var showingStopButton: Bool = false
    @State var showingSnoozeButton: Bool = false
    
    @StateObject var chosenRingtone = ChosenRingtone()
    
    @State var dateCompo: DateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: Date.now)
    
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Text(currentAmPm).foregroundColor(.white).padding(.top, 120).font(.custom("digital-7", size: 70)).shadow(color: .blue, radius: 5, x: 0, y: 0).shadow(color: .blue, radius: 5, x: 0, y: 0).shadow(color: .blue, radius: 5, x: 0, y: 0).padding()
                    Text(myCurrentTime).foregroundColor(.white).font(.custom("digital-7", size: 250)).shadow(color: .blue, radius: 7, x: 0, y: 0).shadow(color: .blue, radius: 8, x: 0, y: 0).shadow(color: .blue, radius: 8, x: 0, y: 0)
                    
                    VStack {
                        
                        Image(systemName: "bell.fill")
                        Text(alarmTime)
                        
                    }.padding(.leading, 30).foregroundColor(.white).shadow(color: .blue, radius: 7, x: 0, y: 0).shadow(color: .blue, radius: 8, x: 0, y: 0).shadow(color: .blue, radius: 8, x: 0, y: 0).opacity(isSetAlarm ? 1.0 : 0.0).onTapGesture {
                        
                        
                        // When click on bell stop the alarm
                        AlarmRingtoneHandler.stopSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                        
                        AlarmRingtoneHandler.playSoundAlarm(soundOf: AlarmRingtoneHandler.clickSoundId)
                        
                        isSetAlarm = false
                        
                        // hind the buttons of snooze and stop if they shows
                        showingStopButton = false
                        showingSnoozeButton = false
                        
                        removeNotification(withIdentifier: LOCAL_NOTIFICATION_IDENTIFIER)
                        
                    }.onChange(of: Date().formatted(date: .numeric, time: .standard)) { newValue in
                        
                        
                        if isSetAlarm == true {
                            
                            let together = "\(myCurrentTime) \(currentAmPm)"
                            
                            let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
                            
                            
                            if chosenRingtone.pickedRingtone {
                                
                                checkLocalNotificationAuthorization(notificationTitle: appName, notificationBody: "it's time to wake up", notificationRingtone: chosenRingtone.chosenRingtoneName, dateComponents: dateCompo, itsAboutTimeInterval: false, identifier: LOCAL_NOTIFICATION_IDENTIFIER)
                                
                                AlarmRingtoneHandler.loadSoundEffect(nameOf: chosenRingtone.chosenRingtoneName, soundOf: &AlarmRingtoneHandler.alarmSoundId)
                                
                                
                                
                            } else {
                                
                                checkLocalNotificationAuthorization(notificationTitle: appName, notificationBody: "it's time to wake up", notificationRingtone: "morning_alarm.mp3", dateComponents: dateCompo, itsAboutTimeInterval: false, identifier: LOCAL_NOTIFICATION_IDENTIFIER)
                                
                                AlarmRingtoneHandler.loadSoundEffect(nameOf: "morning_alarm.mp3", soundOf: &AlarmRingtoneHandler.alarmSoundId)
                                
                            }
                            
                            
                            
                            
                            if alarmTime == together {
                                
                                showingStopButton = true
                                showingSnoozeButton = true
                                
                                AlarmRingtoneHandler.playSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                                
                            }
                            
                        } else {
                            
                            removeNotification(withIdentifier: LOCAL_NOTIFICATION_IDENTIFIER)
                            
                        }
                        
                    }
                    
                }.padding(.bottom).onTapGesture {
                    
                    showingAlarmPicker = true
                    
                }.sheet(isPresented: $showingAlarmPicker) {
                    
                    AlarmTimePicker(isSetAlarm: $isSetAlarm, alarmTime: $alarmTime, dateCompo: $dateCompo)
                    
                }
                
                
                
                if showingStopButton == true && showingSnoozeButton == true {
                    
                    HStack(spacing: UIScreen.main.bounds.midX / 1.2) {
                        
                        Button {
                            
                            
                            // disapear snooze stop buttons
                            showingStopButton = false
                            showingSnoozeButton = false
                            
                            // stop alarm ringtone
                            AlarmRingtoneHandler.stopSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                            
                            
                            let snooze5minutes: Date = Date(timeIntervalSinceNow: 300)
                            
                            let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
                            
                            let spliting = getSnoozeTime(snoozeDate: snooze5minutes).split(separator: " ")
                            
                            let snoozeTime = spliting[0]
                            let snoozeTypo = spliting[1]
                            
                            let newMyCurrentTime = String(snoozeTime)
                            let newCurrentAmPm = String(snoozeTypo)
                            
                            // here but the new time in alerttime
                            let newAlarmTimeAfterSnooze = "\(newMyCurrentTime) \(newCurrentAmPm)"
                            alarmTime = newAlarmTimeAfterSnooze
                            
                            checkLocalNotificationAuthorization(notificationTitle: appName, notificationBody: "snoozing not good for you, it's time to wake up", notificationRingtone: "morning_alarm.mp3", dateComponents: dateCompo, itsAboutTimeInterval: true, identifier: LOCAL_NOTIFICATION_IDENTIFIER)
                            
                        } label: {
                            
                            Capsule(style: .continuous).frame(width: 90, height: 60, alignment: .center).foregroundColor(.gray).opacity(0.75).overlay {
                                
                                Text("SNOOZE").foregroundColor(.white).bold()
                                
                            }
                            
                        }
                        
                        Button {
                            
                            
                            // hide the bell of alarm
                            isSetAlarm = false
                            
                            
                            
                            // disapear snooze stop buttons
                            showingStopButton = false
                            showingSnoozeButton = false
                            
                            
                            // stop alarm ringtone
                            AlarmRingtoneHandler.stopSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                            
                            removeNotification(withIdentifier: LOCAL_NOTIFICATION_IDENTIFIER)
                            
                        } label: {
                            
                            Capsule(style: .continuous).frame(width: 90, height: 60, alignment: .center).foregroundColor(.red).opacity(0.75).overlay {
                                
                                Text("STOP").foregroundColor(.white).bold()
                                
                            }
                            
                        }

                    }
                    
                }
                
                
                
            }.padding(.top, 50)
            
            
        }.environmentObject(chosenRingtone).onAppear(perform: {
            
            let calendar = Calendar.current
            
            let sec = calendar.component(.second, from: Date())
            let min = calendar.component(.minute, from: Date())
            let hour = calendar.component(.hour, from: Date())

            withAnimation(Animation.linear(duration: 0.01)) {
                currentTime = Time(hour: hour, minute: min, second: sec)
            }
            
            let spliting = getTime().split(separator: " ")
            
            let time = spliting[0]
            let typo = spliting[1]
            
            myCurrentTime = String(time)
            currentAmPm = String(typo)
            
            
            if isSetAlarm == true {
                
                AlarmRingtoneHandler.loadSoundEffect(nameOf: "click-2.mp3", soundOf: &AlarmRingtoneHandler.clickSoundId)
                
            }
            
            
        })
        .onReceive(receiver) { _ in
            let calendar = Calendar.current
            
            let sec = calendar.component(.second, from: Date())
            let min = calendar.component(.minute, from: Date())
            let hour = calendar.component(.hour, from: Date())

            withAnimation(Animation.linear(duration: 0.01)) {
                currentTime = Time(hour: hour, minute: min, second: sec)
            }
            
            let spliting = getTime().split(separator: " ")
            
            let time = spliting[0]
            let typo = spliting[1]
            
            myCurrentTime = String(time)
            currentAmPm = String(typo)
            
            
            /*print("complete - complete: \(Date().formatted(date: .complete, time: .complete))")
            
            print("============================================================================")
            
            print("abbreviated - standard: \(Date().formatted(date: .abbreviated, time: .standard))")
            
            print("============================================================================")
            
            print("numeric - omitted: \(Date().formatted(date: .numeric, time: .omitted))")
            
            print("============================================================================")
            
            print("long - shortened: \(Date().formatted(date: .long, time: .shortened))")
            
            print("============================================================================")
            
            print("omitted - standard: \(Date().formatted(date: .omitted, time: .standard))")
            
            print("============================================================================")
            
            print("numeric - standard: \(Date().formatted(date: .numeric, time: .standard))")
            
            print("*****************************************************************************")
            
            print(" ")
            print(" ")
            print(" ")*/
            
            
        }
    }
}


struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
