//
//  WhiteMintSettingsListView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 26/09/1447 AH.
//


import SwiftUI


struct WhiteMintSettingsListView: View {
    
    init() {
        
        UINavigationBar.appearance().backgroundColor = UIColor.systemMint
        
        
        // Don't transparent the navigationBar when scroll
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        // ... customize colors, fonts, etc.
        appearance.titleTextAttributes = [
            
            .foregroundColor : UIColor.white
            //.backgroundColor : UIColor.yellow
        
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: WhiteMintRingtoneListView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "bell").foregroundColor(.mint)
                            Text("Ringtones").foregroundColor(.mint)
                            
                        }
                        
                    }
                }.listRowBackground(Color.white)
                
                NavigationLink(destination: WhiteMintThemesView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "paintbrush").foregroundColor(.mint)
                            Text("Themes").foregroundColor(.mint)
                            
                        }
                        
                    }
                }.listRowSeparatorTint(Color.mint).listRowBackground(Color.white)
                
                NavigationLink(destination: WhiteMintAboutView()) {
                    HStack {
                        
                        HStack {
                            
                            Image(systemName: "exclamationmark.circle").foregroundColor(.mint)
                            Text("About The App").foregroundColor(.mint)
                            
                        }
                        
                    }
                }.listRowBackground(Color.white)
                
            }.navigationTitle(Text("Settings")).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(false).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").font(.title2).foregroundColor(.white)//.shadow(color: .white, radius: 9, x: 0, y: 0).shadow(color: .yellow, radius: 9, x: 0, y: 0).shadow(color: .white, radius: 9, x: 0, y: 0).shadow(color: .white, radius: 9, x: 0, y: 0)
                        
                    }

                }
                
            }
            
        }
        
    }
    
    
}


struct WhiteMintSettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteMintSettingsListView()
    }
}
