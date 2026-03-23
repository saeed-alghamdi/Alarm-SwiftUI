//
//  BlackRedAboutView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 25/09/1447 AH.
//

import SwiftUI

struct BlackRedAboutView: View {
    var body: some View {
        ZStack {
            
            Color.red.ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Text("This app is a miniature version of the Apple Clock app; it's open source, and anyone can use the source code without prior permission.\n\nIf you have any ideas contact me at the github page.\n\nThis app made to know how clocks works in apple clock app with have limitation such as:\n1- can't run the app in background.\n2- can't refresh the app icon like apple clock icon.").font(.callout)
                    
                }.foregroundColor(.black).padding()
                
            }
            
        }
    }
}

struct BlackRedAboutView_Previews: PreviewProvider {
    static var previews: some View {
        BlackRedAboutView()
    }
}
