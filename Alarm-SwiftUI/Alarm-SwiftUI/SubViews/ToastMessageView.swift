//
//  ToastMessageView.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 23/09/1447 AH.
//

import SwiftUI


struct ToastMessageView: View {
    
    @Binding var isShowing: Bool
    @Binding var toastMessageForgroundColor: Color
    @Binding var toastMessageText: String
    @Binding var toastMessageShadowColor: Color
    @Binding var toastMessageTextColor: Color
    
    var body: some View {
        
        VStack {
            
            if isShowing {
                
                RoundedRectangle(cornerRadius: 25).foregroundColor(toastMessageForgroundColor).frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4, alignment: .center).transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity)).overlay(alignment: .center) {
                    
                    Text(toastMessageText).foregroundColor(toastMessageTextColor).padding()
                    
                }.padding(.bottom, UIScreen.main.bounds.midY + 20).onAppear {
                    
                    // Disapear the toast message after 2 seconds from now
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                    
                }.padding(.top, 120).shadow(color: toastMessageShadowColor, radius: 5, x: 0, y: 0).shadow(color: toastMessageShadowColor, radius: 5, x: 0, y: 0).shadow(color: toastMessageShadowColor, radius: 5, x: 0, y: 0)
                
                
            }
            
        }
        
    }
    
}
