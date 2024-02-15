//
//  ServerDetails.swift
//  vodimator-test
//
//  Created by Darren Reely on 2/14/24.
//

import Foundation

// http://my-flashtv.com:8080/player_api.php?username=SOMEUSERNAME&password=SOMEPASSWORD
struct ServerDetails : Codable {
    var requestMethod = "GET"
    var prefix = "http"
    var server = "server"
    var port = "8080"
    var path = "player_api.php"
    var usernameField = "username"
    var passwordField = "password"
    
    func loginPath(name: String, password: String, server: String) -> String {
        
//        usernameField = name
//        passwordField = pw
//        self.server = server
        
        return prefix
        + "://" + server
        + ":" + port
        + "/"
        + path + "?"
        + usernameField + "=" + name
        + "&" + passwordField + "=" + password
    }
}
