//
//  BlackRedSettingsListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import SwiftUI


struct BlackRedSettingsListView: View {
    
    init() {
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.red
        ]
        UINavigationBar.appearance().backgroundColor = UIColor.red
        /*UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().scrollEdgeAppearance?.backgroundColor = UIColor.black
        UINavigationBar.appearance().compactAppearance?.backgroundColor = UIColor.black*/
        //UINavigationBar.appearance().compactScrollEdgeAppearance?.backgroundColor = UIColor.black
        
        // List Background Color
        UITableView.appearance().backgroundColor = UIColor.red
        UITableView.appearance().tintColor = UIColor.blue
        
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.red
        
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: BlackRedRingtoneListView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.black)
                            Text("Ringtones").foregroundColor(.black)
                            
                        }
                        Spacer()
                        //Image(systemName: "chevron.right").foregroundColor(.black)
                        
                    }
                }.listRowBackground(Color(red: 234 / 255, green: 77 / 255, blue: 60 / 255))
                
                NavigationLink(destination: BlackRedThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.black)
                            Text("Themes").foregroundColor(.black)
                            
                        }
                        Spacer()
                        //Image(systemName: "chevron.right").foregroundColor(.black)
                        
                    }
                }.listRowSeparatorTint(Color(uiColor: UIColor.black)).listRowBackground(Color(red: 234 / 255, green: 77 / 255, blue: 60 / 255))
                
                NavigationLink(destination: BlackRedAboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.black)
                            Text("About The App").foregroundColor(.black)
                            
                        }
                        Spacer()
                        //Image(systemName: "chevron.right").foregroundColor(.black)
                        
                    }
                }.listRowBackground(Color(red: 234 / 255, green: 77 / 255, blue: 60 / 255))
                
            }.navigationTitle(Text("Settings")).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(false).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").font(.title2).foregroundColor(.white).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0).shadow(color: .black, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
        }
        
    }
    
    
}


struct BlackRedSettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BlackRedSettingsListView()
    }
}

