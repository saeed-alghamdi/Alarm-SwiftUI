//
//  PinkWhiteSettingsListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 26/09/1447 AH.
//

import SwiftUI


struct PinkWhiteSettingsListView: View {
    
    init() {
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor(.pink),
            .backgroundColor : UIColor.white
        
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: PinkWhiteRingtoneListView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.white)
                            Text("Ringtones").foregroundColor(.white)
                            
                        }
                        
                    }
                }.listRowBackground(Color.pink)
                
                NavigationLink(destination: PinkWhiteThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.white)
                            Text("Themes").foregroundColor(.white)
                            
                        }
                        
                    }
                }.listRowSeparatorTint(Color.white).listRowBackground(Color.pink)
                
                NavigationLink(destination: PinkWhiteAboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.white)
                            Text("About The App").foregroundColor(.white)
                            
                        }
                        
                    }
                }.listRowBackground(Color.pink)
                
            }.navigationTitle(Text("Settings")).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(false).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").font(.title2).foregroundColor(.pink).shadow(color: .blue, radius: 9, x: 0, y: 0)//.shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
        }
        
    }
    
    
}


struct PinkWhiteSettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        PinkWhiteSettingsListView()
    }
}
