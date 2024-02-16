//
//  SignInView.swift
//  Vodimator
//
//  Created by Darren Reely on 2/14/24.
//

import SwiftUI

/* Sign In
 tapping sign in disables field entry and the sign-in button
 keyboard - appropriate kb for each field un, pw, url
 - move hidden content up so user sees field
 - keyboard may have 'Done', 'Submit', 'Next' button, if sign-in active then execute the sign-in.
 disable sign in button util all required fields are filled in and valid
 
 authenticate url format
 
 feedback on url while typing - red for invalid - green for valid - border color
 
 terms of use and privacy policy popup bottons.
 logo at top
 
 iptv ? player_api.php ?
 */

struct SignInView : View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var authentication = AuthenticationController()
    
    @State var nickName : String = ""
    @State var userName : String = ""
    @State var password : String = ""
    @State var siteUrl : String = ""
    
    @State var disableAllInput = false // should use authentication.authenticationInProgress
    
    var disabledButton : Bool {
        return disableAllInput || userName.isEmpty || password.isEmpty || siteUrl.isEmpty
    }
    
    var buttonColor : Color {
        return disabledButton ? .gray : defaultButtonColor
    }
    
    var urlBorderColor : Color {
        return siteUrl.isEmpty ? .gray : siteUrl.isValidURL ? .green : .red
    }
    
    var inputTextColor : Color {
        return colorScheme == .light ? .black : .white
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Sign In")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            VStack(alignment: .leading,spacing: 5) {
                Text("User Name")
                    .fontWeight(.bold)
                TextField("mySiteUserNameKey",
                          text: $userName,
                          prompt: Text("Required"))
                .disabled(disableAllInput)
                .foregroundColor(disableAllInput ? .gray : inputTextColor)
                .padding(8)
                .border(.gray, width: 1)
                .background(Color.black.opacity(0.03))
            }
            
            VStack(alignment: .leading,spacing: 5) {
                Text("Password")
                    .fontWeight(.bold)
                SecureField("myPasswordKey", text: $password, prompt: Text("Required"))
                    .disabled(disableAllInput)
                    .foregroundColor(disableAllInput ? .gray : inputTextColor)
                    .padding(8)
                    .border(.gray, width: 1)
                    .background(Color.black.opacity(0.03))
            }
            
            VStack(alignment: .leading,spacing: 5) {
                Text("Site URL")
                    .fontWeight(.bold)
                TextField("myUrlKey",
                          text: $siteUrl,
                          prompt: Text("Required"))
                .disabled(disableAllInput)
                .foregroundColor(disableAllInput ? .gray : inputTextColor)
                .padding(8)
                .border(urlBorderColor, width: 2)
                .background(Color.black.opacity(0.03))
            }
            
            HStack {
                Spacer()
                Button(action: {
                    signIn()
                }, label: {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(buttonColor)
                })
                .disabled(disabledButton)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 9.0)
                        .stroke(buttonColor, lineWidth: 2)
                )
                Spacer()
            }
            .padding(.top, 20) // add a extra gap above button.
            
            HStack {
                Spacer()
                NoticeOfConditionsView()
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                Spacer()
            } //.border(.blue)
        }
        .padding(.horizontal)
        .border(.red)
    }
    
    private func signIn() {
        print("Signing In...")
        // TEST CODE
        disableAllInput = true
        let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            disableAllInput = false
        }
    }
}


#Preview {
    SignInView()
}

