//
//  NoticeOfConditionsView.swift
//  Vodimator
//
//  Created by Darren Reely on 2/15/24.
//

import SwiftUI

struct NoticeOfConditionsView : View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var displayTandCSheet = false
    @State private var displayPrivacySheet = false
    
    var containerColor : Color {
        return colorScheme == .light ? .black : .white
    }
    
    var containerBackGroundOpacity : CGFloat {
        return colorScheme == .light ? 0.05 : 0.1
    }
    
    var longTextBackgroundColor : Color {
        return colorScheme == .light ? Color.black.opacity(0.05) : Color.white.opacity(0.1)
    }
    
    var body : some View {
        VStack(spacing: 20) {
            Button(action: {
                displayTandCSheet.toggle()
            }, label: {
                Text("Terms and Conditions")
                    .fontWeight(.bold)
                    .foregroundColor(defaultButtonColor)
            })
            .sheet(isPresented: $displayTandCSheet,
                   //               onDismiss: {
                   //            displayTandCSheet.toggle()
                   //        },
                   content: {
                ZStack {
                    longTextBackgroundColor.edgesIgnoringSafeArea(.all)
                    VStack {
                        Text(TandCText)
                            .padding(20)
                        Spacer()
                    }
                }
            })
            
            Button(action: {
                displayPrivacySheet.toggle()
            }, label: {
                Text("Privacy Information")
                    .fontWeight(.bold)
                    .foregroundColor(defaultButtonColor)
            })
            .sheet(isPresented: $displayPrivacySheet,
                   //               onDismiss: {
                   //            displayPrivacySheet.toggle()
                   //        },
                   content: {
                ZStack {
                    longTextBackgroundColor.edgesIgnoringSafeArea(.all)
                    VStack {
                        Text(privacyText)
                            .padding(20)
                        Spacer()
                    }
                }
            }
            ) //.background(.green) DOES INFLUENCE COLOR BUT NOT SET TO THIS COLOR
            
        }
        .padding(20)
        .background(containerColor.opacity(containerBackGroundOpacity))
        .clipShape(RoundedRectangle(cornerRadius: 9.0, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 9.0)
                .stroke(containerColor.opacity(0.2), lineWidth: 1)
        )
        //.border(.purple)
    }
}

#Preview {
    NoticeOfConditionsView()
}
