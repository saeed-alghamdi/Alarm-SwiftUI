//
//  WhiteBlueSettingsListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import SwiftUI


struct WhiteBlueSettingsListView: View {
    
    init() {
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor.blue,
            .backgroundColor : UIColor.white
        
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: WhiteBlueRingtoneListView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.blue)
                            Text("Ringtones").foregroundColor(.blue)
                            
                        }
                        
                        
                    }
                }.listRowBackground(Color.white)
                
                NavigationLink(destination: WhiteBlueThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.blue)
                            Text("Themes").foregroundColor(.blue)
                            
                        }
                        
                    }
                }.listRowSeparatorTint(Color.blue).listRowBackground(Color.white)
                
                NavigationLink(destination: WhiteBlueAboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.blue)
                            Text("About The App").foregroundColor(.blue)
                            
                        }
                        
                    }
                }.listRowBackground(Color.white)
                
            }.navigationTitle(Text("Settings")).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(false).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").font(.title2).foregroundColor(.white).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .blue, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
        }
        
    }
    
    
}


struct WhiteBlueSettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteBlueSettingsListView()
    }
}
