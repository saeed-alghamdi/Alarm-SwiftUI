//
//  YellowBlackSettingsListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 26/09/1447 AH.
//

import SwiftUI


//
//  SettingsList.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 11/04/1446 AH.
//

import SwiftUI


struct YellowBlackSettingsListView: View {
    
    init() {
        
        UINavigationBar.appearance().backgroundColor = UIColor.yellow
        
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor.black,
            .backgroundColor : UIColor.yellow
        
        ]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        UITableView.appearance().backgroundColor = UIColor.yellow
        
    }
    
    
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: YellowBlackRingtoneListView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.black)
                            Text("Ringtones").foregroundColor(.black)
                            
                        }
                        
                    }
                }.listRowBackground(Color.yellow)
                
                NavigationLink(destination: YellowBlackThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.black)
                            Text("Themes").foregroundColor(.black)
                            
                        }
                        
                    }
                }.listRowSeparatorTint(Color.black).listRowBackground(Color.yellow)
                
                NavigationLink(destination: YellowBlackAboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.black)
                            Text("About The App").foregroundColor(.black)
                            
                        }
                        
                    }
                }.listRowBackground(Color.yellow)
                
            }.navigationTitle(Text("Settings")).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(false).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").font(.title2).foregroundColor(.black).shadow(color: .blue, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
        }
        
    }
    
    
}


struct YellowBlackSettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        YellowBlackSettingsListView()
    }
}
