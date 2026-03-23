//
//  WhiteBlueAlarmPickerView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import SwiftUI

struct WhiteBlueAlarmTimePickerView: View {
    
    @State var currentTime = Date()
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var isSetAlarm: Bool
    @Binding var alarmTime: String
    
    @Binding var dateCompo: DateComponents
    
    @State var showingRingtonesView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color.white.ignoresSafeArea()
                
                VStack {
                    
                    DatePicker("", selection: $currentTime, displayedComponents: .hourAndMinute).datePickerStyle(.wheel).offset(x: -UIScreen.main.bounds.width / 4, y: 0).shadow(color: .blue, radius: 1, x: 0, y: 0)//.shadow(color: .blue, radius: 1, x: 0, y: 0)
                    
                    Text(currentTime.formatted(date: .omitted, time: .shortened)).foregroundColor(.blue).font(.title).foregroundColor(.blue).bold().padding(.bottom, 20)
                    
                    VStack(spacing: 20) {
                        
                        Button {
                            
                            isSetAlarm = true
                            alarmTime = currentTime.formatted(date: .omitted, time: .shortened)
                            dateCompo = Calendar.current.dateComponents([.hour, .minute, .second], from: currentTime)
                            
                            AlarmRingtoneHandler.playSoundAlarm(soundOf: AlarmRingtoneHandler.clickSoundId)
                            
                            dismiss.callAsFunction()
                            
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 20).strokeBorder(.blue, lineWidth: 3.0).foregroundColor(.white).shadow(color: .blue, radius: 2, x: 0, y: 0).shadow(color: .black, radius: 2, x: 0, y: 0).shadow(color: .white, radius: 2, x: 0, y: 0).shadow(color: .blue, radius: 2, x: 0, y: 0).frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 9, alignment: .center).overlay {
                                                            
                                                            Text("Set Alarm").foregroundColor(.blue).shadow(color: .white, radius: 2, x: 0, y: 0).shadow(color: .white, radius: 2, x: 0, y: 0)
                                                            
                                }
                            
                        }
                        
                        
                        
                    }

                }.toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button {
                            
                            dismiss.callAsFunction()
                            
                        } label: {
                            
                            Image(systemName: "chevron.down").font(.title2).foregroundColor(.white).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0)
                            
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            
                            showingRingtonesView = true
                            
                        } label: {
                            
                            Image(systemName: "gearshape").font(.title2).foregroundColor(.white).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0)
                            
                        }.fullScreenCover(isPresented: $showingRingtonesView) {
                            
                            WhiteBlueSettingsListView()
                            
                        }

                    }
                    
                }
                
            }.onAppear {
                
                AlarmRingtoneHandler.loadSoundEffect(nameOf: "click-3.mp3", soundOf: &AlarmRingtoneHandler.clickSoundId)
                
            }
            
        }
        
    }
    
}

struct WhiteBlueAlarmTimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteBlueAlarmTimePickerView(isSetAlarm: .constant(false), alarmTime: .constant("4:30"), dateCompo: .constant(Calendar.current.dateComponents([.hour, .minute, .second], from: Date.now)))
    }
}

