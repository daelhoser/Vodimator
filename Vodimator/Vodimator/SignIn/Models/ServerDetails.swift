//
//  ServerDetails.swift
//  Vodimator
//
//  Created by Darren Reely on 2/14/24.
//

import Foundation

// http://SOMESERVER:8080/player_api.php?username=SOMEUSERNAME&password=SOMEPASSWORD
struct ServerDetails : Codable {
    var requestMethod = "GET"
    var prefix = "http"
//    var server = "server"
    var port = "8080"
    var path = "player_api.php"
    var usernameField = "username"
    var passwordField = "password"
    
    func signInPath(name: String, password: String, server: String) -> String {
        return prefix
        + "://" + server
        + ":" + port
        + "/"
        + path + "?"
        + usernameField + "=" + name
        + "&" + passwordField + "=" + password
    }
}
