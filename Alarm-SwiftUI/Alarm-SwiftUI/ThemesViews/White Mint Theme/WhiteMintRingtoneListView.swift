//
//  WhiteMintRingtoneListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 26/09/1447 AH.
//


import SwiftUI


struct WhiteMintRingtoneListView: View {
    
    @State var ringtones = AlarmRingtoneHandler.getAllRingtones()
    
    @State var lastElementYouClickedOn: [UUID] = []
    
    @State var lastElementYouChoose: [UUID] = []
    
    @State var showingToastMessage: Bool = false
    
    @EnvironmentObject var chosenRingtone: ChosenRingtone
    
    @Environment(\.dismiss) var dismiss
    
    
    // Toast Message State Properities
    @State var isShowingToastMessage: Bool = false
    @State var toastMessageForgroundColor: Color = .blue
    @State var toastMessageText: String = "Ringtone has been changed"
    @State var toastMessageShadowColor: Color = .white
    @State var toastMessageTextColor: Color = .white
    
    
    var body: some View {
        
        ZStack {
            
            List {
                
                
                ForEach($ringtones, id: \.id) { $index in
                    
                    VStack {
                        
                        HStack {
                            
                            
                            
                            // Ringtone Player and Name
                            Button {
                                
                                // Play sound when click on button
                                index.isPlay.toggle()
                                lastElementYouClickedOn.append(index.id)
                                
                                if index.isPlay {
                                    
                                    
                                    AlarmRingtoneHandler.stopSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                                    AlarmRingtoneHandler.loadSoundEffect(nameOf: index.name, soundOf: &AlarmRingtoneHandler.alarmSoundId)
                                    AlarmRingtoneHandler.playSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                                    
                                } else {
                                    
                                    AlarmRingtoneHandler.stopSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                                    
                                }
                                
                                
                            } label: {
                                
                                if let lastElement = lastElementYouClickedOn.last {
                                    
                                    if lastElement == index.id {
                                        
                                        Image(systemName: index.isPlay ? "pause.fill" : "play.fill").tint(.mint)
                                        
                                    } else {
                                        
                                        Image(systemName: "play.fill").tint(.mint)
                                        
                                    }
                                    
                                } else {
                                    
                                    Image(systemName: "play.fill").tint(.mint)
                                    
                                }
                                
                            }
                            
                            Text(index.name).foregroundColor(.mint)
                            
                            Spacer()
                            
                            
                            
                            // Ringtone Picker
                            Button {
                                
                                // chooes ringtone here
                                lastElementYouChoose.append(index.id)
                                
                                // add ringtone info to the publisher
                                chosenRingtone.pickedRingtone = true
                                //chosenRingtone.chosenRingtoneName = index.name
                                chosenRingtone.chosenRingtoneName = index.name
                                
                                
                                withAnimation {
                                    
                                    showingToastMessage = true
                                    
                                }
                                
                                
                            } label: {
                                
                                if let lastElement = lastElementYouChoose.last {
                                    
                                    
                                    if lastElement == index.id {
                                        
                                        Image(systemName: "checkmark").tint(.mint)
                                        
                                    } else {
                                        
                                        Image(systemName: "checkmark").tint(.brown)
                                        
                                    }
                                    
                                } else {
                                    
                                    Image(systemName: "checkmark").tint(.brown)
                                    
                                }
                                    
                            }

                        }

                    }.padding([.bottom, .top], 8).listRowSeparatorTint(Color.mint).listRowBackground(Color.white)
                    
                }
                
            }.onDisappear {
                
                AlarmRingtoneHandler.stopSoundAlarm(soundOf: AlarmRingtoneHandler.alarmSoundId)
                
            }.navigationBarBackButtonHidden(true)
            
            ToastMessageView(isShowing: $isShowingToastMessage, toastMessageForgroundColor: $toastMessageForgroundColor, toastMessageText: $toastMessageText, toastMessageShadowColor: $toastMessageShadowColor, toastMessageTextColor: $toastMessageTextColor)
            
        }.toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    
                    dismiss.callAsFunction()
                    
                } label: {
                    
                    Image(systemName: "chevron.left").font(.title2).foregroundColor(.white).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0)
                    
                }

            }
            
        }
    }
}

struct WhiteMintRingtoneListView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteMintRingtoneListView()
    }
}

