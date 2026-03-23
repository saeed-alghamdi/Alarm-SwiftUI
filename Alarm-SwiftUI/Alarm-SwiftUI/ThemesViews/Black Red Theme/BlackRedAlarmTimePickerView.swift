//
//  BlackRedAlarmTimePickerView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import SwiftUI

struct BlackRedAlarmTimePickerView: View {
    
    @State var currentTime = Date()
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var isSetAlarm: Bool
    @Binding var alarmTime: String
    
    @Binding var dateCompo: DateComponents
    
    @State var showingRingtonesView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color.red.ignoresSafeArea()
                
                VStack {
                    
                    DatePicker("", selection: $currentTime, displayedComponents: .hourAndMinute).colorInvert().colorMultiply(.white).datePickerStyle(.wheel).offset(x: -UIScreen.main.bounds.width / 4, y: 0).shadow(color: .black, radius: 1, x: 0, y: 0).shadow(color: .black, radius: 1, x: 0, y: 0)
                    
                    Text(currentTime.formatted(date: .omitted, time: .shortened)).foregroundColor(.black).font(.title).foregroundColor(.black).bold().padding(.bottom, 20)
                    
                    VStack(spacing: 20) {
                        
                        Button {
                            
                            isSetAlarm = true
                            alarmTime = currentTime.formatted(date: .omitted, time: .shortened)
                            dateCompo = Calendar.current.dateComponents([.hour, .minute, .second], from: currentTime)
                            
                            AlarmRingtoneHandler.playSoundAlarm(soundOf: AlarmRingtoneHandler.clickSoundId)
                            
                            dismiss.callAsFunction()
                            
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 20).strokeBorder(.white, lineWidth: 3.0).foregroundColor(.white).shadow(color: .black, radius: 2, x: 0, y: 0).shadow(color: .black, radius: 2, x: 0, y: 0).shadow(color: .black, radius: 2, x: 0, y: 0).shadow(color: .black, radius: 2, x: 0, y: 0).frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 9, alignment: .center).overlay {
                                
                                Text("Set Alarm").foregroundColor(.white).shadow(color: .black, radius: 2, x: 0, y: 0).shadow(color: .black, radius: 2, x: 0, y: 0)
                                
                            }
                            
                        }
                        
                        
                        
                    }

                }.toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button {
                            
                            dismiss.callAsFunction()
                            
                        } label: {
                            
                            Image(systemName: "chevron.down").font(.title2).foregroundColor(.white).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0)
                            
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            
                            showingRingtonesView = true
                            
                        } label: {
                            
                            Image(systemName: "gearshape").font(.title2).foregroundColor(.white).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0)
                            
                        }.fullScreenCover(isPresented: $showingRingtonesView) {
                            
                            BlackRedSettingsListView()
                            
                        }

                    }
                    
                }
                
            }.onAppear {
                
                AlarmRingtoneHandler.loadSoundEffect(nameOf: "click-3.mp3", soundOf: &AlarmRingtoneHandler.clickSoundId)
                
            }
            
        }
        
    }
    
}

struct BlackRedAlarmTimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        BlackRedAlarmTimePickerView(isSetAlarm: .constant(false), alarmTime: .constant("4:30"), dateCompo: .constant(Calendar.current.dateComponents([.hour, .minute, .second], from: Date.now)))
    }
}
