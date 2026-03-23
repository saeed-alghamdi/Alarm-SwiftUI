//
//  SettingsList.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 11/04/1446 AH.
//

import SwiftUI


struct SettingsList: View {
    
    init() {
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
        ]
        UINavigationBar.appearance().backgroundColor = UIColor.black
        /*UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().scrollEdgeAppearance?.backgroundColor = UIColor.black
        UINavigationBar.appearance().compactAppearance?.backgroundColor = UIColor.black*/
        //UINavigationBar.appearance().compactScrollEdgeAppearance?.backgroundColor = UIColor.black
        
        // List Background Color
        UITableView.appearance().backgroundColor = UIColor.black
        UITableView.appearance().tintColor = UIColor.blue
        
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
        
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: RingtoneList()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.white)
                            Text("Ringtones").foregroundColor(.white)
                            
                        }
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(.white)
                        
                    }
                }.listRowBackground(Color(red: 28 / 255, green: 27 / 255, blue: 29 / 255))
                
                NavigationLink(destination: ThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.white)
                            Text("Themes").foregroundColor(.white)
                            
                        }
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(.white)
                        
                    }
                }.listRowSeparatorTint(Color(uiColor: UIColor.systemGray)).listRowBackground(Color(red: 28 / 255, green: 27 / 255, blue: 29 / 255))
                
                NavigationLink(destination: AboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.white)
                            Text("About The App").foregroundColor(.white)
                            
                        }
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(.white)
                        
                    }
                }.listRowBackground(Color(red: 28 / 255, green: 27 / 255, blue: 29 / 255))
                
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


struct SettingsList_Previews: PreviewProvider {
    static var previews: some View {
        SettingsList()
    }
}
