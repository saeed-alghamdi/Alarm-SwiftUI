//
//  WhiteBlueThemeView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import SwiftUI

import SwiftUI

struct WhiteBlueThemesView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // Store the status of the theme app with 0 as default theme number
    @AppStorage("themeNumber") var themeNumber: Int = 0
    
    // Toast Message State Properities
    @State var isShowingToastMessage: Bool = false
    @State var toastMessageForgroundColor: Color = .white
    @State var toastMessageText: String = "Theme change, please relaunch the app to changes take effect"
    @State var toastMessageShadowColor: Color = .blue
    @State var toastMessageTextColor: Color = .blue
    
    
    var body: some View {
        
        ZStack {
            
            List {
                
                Section {
                    
                    
                    // Theme Default
                    Button {
                        
                        themeNumber = 0
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.black)
                                Image(systemName: "circle.dashed.inset.fill").tint(.blue)
                            }
                            
                            Text("Default Theme").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                    // Theme 1
                    Button {
                        
                        themeNumber = 1
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.red)
                                Image(systemName: "circle.dashed.inset.fill").tint(.black)
                            }
                            
                            Text("Red / Black").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                    // Theme 2
                    Button {
                        
                        themeNumber = 2
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.white)
                                Image(systemName: "circle.dashed.inset.fill").tint(.blue)
                            }
                            
                            Text("White / Blue").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                    // Theme 3
                    Button {
                        
                        themeNumber = 3
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.yellow)
                                Image(systemName: "circle.dashed.inset.fill").tint(.black)
                            }
                            
                            Text("Yellow / Black").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                    // Theme 4
                    Button {
                        
                        themeNumber = 4
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.blue)
                                Image(systemName: "circle.dashed.inset.fill").tint(.orange)
                            }
                            
                            Text("Blue / Orange").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                    // Theme 5
                    Button {
                    
                        themeNumber = 5
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.pink)
                                Image(systemName: "circle.dashed.inset.fill").tint(.white)
                            }
                            
                            Text("Pink / White").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                    // theme 6
                    Button {
                        
                        themeNumber = 6
                        withAnimation {
                            isShowingToastMessage = true
                        }
                        
                        
                    } label: {
                        
                        HStack {
                            
                            VStack {
                                Image(systemName: "circle.dashed.inset.fill").tint(.white)
                                Image(systemName: "circle.dashed.inset.fill").tint(.mint)
                            }
                            
                            Text("White / Mint").tint(.blue)
                            
                        }
                        
                    }
                    
                    
                }.listRowSeparatorTint(Color.blue).listRowBackground(Color.white)
                
            }.navigationBarBackButtonHidden(true).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.left").font(.title2).foregroundColor(.white).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
            ToastMessageView(isShowing: $isShowingToastMessage, toastMessageForgroundColor: $toastMessageForgroundColor, toastMessageText: $toastMessageText, toastMessageShadowColor: $toastMessageShadowColor, toastMessageTextColor: $toastMessageTextColor)
            
        }
        
    }
    
}

struct WhiteBlueThemesView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteBlueThemesView()
    }
}
