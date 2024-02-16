//
//  AuthenticationController.swift
//  Vodimator
//
//  Created by Darren Reely on 2/14/24.
//

import Foundation
import Combine

class AuthenticationController : ObservableObject {
    @Published var authenticationInProgress = false
    @Published var authenticated : Bool = false
    
    var nickName : String = ""
    var user : String?
    var password : String?
    var url : String?
    
    var signInResult : SignInResult?
    
    func submitSignIn() async {
        guard user?.isEmpty == false && password?.isEmpty == false && url?.isEmpty == false else {
            print("AuthenticationController - submitSignIn() - Require user name, password, and site.")
            return
        }
        
        print("PERFORM SIGN IN.")
        authenticationInProgress = true
        
        do {
            signInResult = try await signIn()
            authenticated = signInResult?.userInfo?.auth == 1
            if let result = signInResult {
                print("signInResult: \(result)")
            }
            authenticationInProgress = false
        } catch {
            signInResult = nil
            authenticationInProgress = false
            authenticated = false
        }
    }
    
    func signIn() async throws -> SignInResult? {
        guard let user = user, let password = password else {
            return nil
        }

        let signInPath = ServerDetails().signInPath(name: user, password: password, server: secretServer)
        print("AuthenticationController.signIn() - signInPath: \(signInPath)")
        do {
            let result = try await URLSession.shared.data(for: URLRequest(url: URL(string: signInPath)!))
            let decoder = JSONDecoder()
            print("SIGN IN GET COMPLETED.")
            do {
                let result = try decoder.decode(SignInResult.self, from: result.0)
                print("SIGN IN SUCCESSFUL : \(result)")
                return result
            } catch {
                print("FAILED TO DECODE SIGN IN RESULT, RETURNING EMPTY RESULT.")
            }
        } catch {
            print("FAILED TO SIGN IN, RETURNING EMPTY RESULT.")
        }

        return nil
    }
    
    private func saveCredentials() {
        print("IMPLEMENT saveCredentials()")
    }
    
    private func savedCredentials() {
        print("IMPLEMENT savedCredentials()")
    }
}
