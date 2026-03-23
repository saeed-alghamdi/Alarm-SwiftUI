//
//  BlueOrangeSettingsListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 26/09/1447 AH.
//

import SwiftUI


struct BlueOrangeSettingsListView: View {
    
    init() {
        
        UINavigationBar.appearance().backgroundColor = UIColor.orange
        
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor.blue,
            .backgroundColor : UIColor.orange
        
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        UITableView.appearance().backgroundColor = UIColor.blue
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: BlueOrangeRingtoneListView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.blue)
                            Text("Ringtones").foregroundColor(.blue)
                            
                        }
                        
                    }
                }.listRowBackground(Color.orange)
                
                NavigationLink(destination: BlueOrangeThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.blue)
                            Text("Themes").foregroundColor(.blue)
                            
                        }
                        
                    }
                }.listRowSeparatorTint(Color.blue).listRowBackground(Color.orange)
                
                NavigationLink(destination: BlueOrangeAboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.blue)
                            Text("About The App").foregroundColor(.blue)
                            
                        }
                        
                    }
                }.listRowBackground(Color.orange)
                
            }.navigationTitle(Text("Settings")).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(false).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").font(.title2).foregroundColor(.blue).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
        }
        
    }
    
    
}


struct BlueOrangeSettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BlueOrangeSettingsListView()
    }
}
