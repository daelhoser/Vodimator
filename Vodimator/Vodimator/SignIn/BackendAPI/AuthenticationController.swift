//
//  AuthenticationController.swift
//  vodimator-test
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
    
    var loginResult : LoginResult?
    
//    func loginPathFeedback() -> String {
//        return ServerDetails().loginPath(name: user!, password: password!, server: secretServer)
//    }
    
    func submitLogin() async {
        guard user?.isEmpty == false && password?.isEmpty == false && url?.isEmpty == false else {
            print("AuthenticationController - submitLogin() - Require user name, password, and site.")
            return
        }
        
        print("PERFORM LOGIN.")
        authenticationInProgress = true
        
        do {
            loginResult = try await login()
            authenticated = loginResult?.userInfo?.auth == 1
            print("loginResult: \(loginResult)")
            authenticationInProgress = false
        } catch {
            loginResult = nil
            authenticationInProgress = false
            authenticated = false
        }
    }
    
    func login() async throws -> LoginResult? {
        guard let user = user, let password = password else {
            return nil
        }

        let loginPath = ServerDetails().loginPath(name: user, password: password, server: secretServer)
        print("AuthenticationController.login() - loginPath: \(loginPath)")
        do {
            let result = try await URLSession.shared.data(for: URLRequest(url: URL(string: loginPath)!))
            let decoder = JSONDecoder()
            print("LOGIN GET COMPLETED.")
            do {
                let result = try decoder.decode(LoginResult.self, from: result.0)
                print("LOGIN SUCCESSFUL : \(result)")
                return result
            } catch {
                print("FAILED TO DECODE LOGIN RESULT, RETURNING EMPTY RESULT.")
            }
        } catch {
            print("FAILED TO LOGIN, RETURNING EMPTY RESULT.")
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
