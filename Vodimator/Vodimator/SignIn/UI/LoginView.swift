//
//  LoginView.swift
//  vodimator-test
//
//  Created by Darren Reely on 2/14/24.
//

import SwiftUI

/* LOGIN
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

struct Login : View {
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
        return disabledButton ? .gray : .blue
    }
    
    var urlBorderColor : Color {
        return siteUrl.isEmpty ? .gray : siteUrl.isValidURL ? .green : .red
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Sign In")
                .fontWeight(.bold)
                .font(.largeTitle)
            
//            VStack(alignment: .leading,spacing: 5) {
//                Text("Your Nick Name")
//                    .fontWeight(.bold)
//                TextField("myNickNameKey",
//                          text: $nickName,
//                          prompt: Text("Your app identifier"))
//                .padding(8)
//                .border(.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                .background(Color.black.opacity(0.03))
//            }
            
            VStack(alignment: .leading,spacing: 5) {
                Text("User Name")
                    .fontWeight(.bold)
                TextField("mySiteUserNameKey",
                          text: $userName,
                          prompt: Text("Required"))
                .disabled(disableAllInput)
                .foregroundColor(disableAllInput ? .gray : .black)
                .padding(8)
                .border(.gray, width: 1)
                .background(Color.black.opacity(0.03))
            }
            
            VStack(alignment: .leading,spacing: 5) {
                Text("Password")
                    .fontWeight(.bold)
                SecureField("myPasswordKey", text: $password, prompt: Text("Required"))
                    .disabled(disableAllInput)
                    .foregroundColor(disableAllInput ? .gray : .black)
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
                .foregroundColor(disableAllInput ? .gray : .black)
                .padding(8)
                .border(urlBorderColor, width: 2)
                .background(Color.black.opacity(0.03))
            }
            
            HStack {
                Spacer()
                Button(action: {
                    login()
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
            .padding(.top) // add a little extra space above button.
            
        }
        .padding(.horizontal)
        .border(.red)
    }
    
    private func login() {
        print("Signing In...")
        // TEST CODE
        disableAllInput = true
        let restoreTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            disableAllInput = false
        }
    }
}


#Preview {
    Login()
}

