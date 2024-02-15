//
//  LoginResult.swift
//  vodimator-test
//
//  Created by Darren Reely on 2/14/24.
//

import Foundation

struct LoginResult: Codable {
  var userInfo   : UserInfo?   = UserInfo()
  var serverInfo : ServerInfo? = ServerInfo()

  enum CodingKeys: String, CodingKey {
    case userInfo   = "user_info"
    case serverInfo = "server_info"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    userInfo = try values.decodeIfPresent(UserInfo.self, forKey: .userInfo)
    serverInfo = try values.decodeIfPresent(ServerInfo.self, forKey: .serverInfo)
  }

  init() {
  }
}


struct ServerInfo: Codable {
  var url            : String? = nil
  var port           : String? = nil
  var httpsPort      : String? = nil
  var serverProtocol : String? = nil
  var rtmpPort       : String? = nil
  var timezone       : String? = nil
  var timestampNow   : Int?    = nil
  var timeNow        : String? = nil
  var process        : Bool?   = nil

  enum CodingKeys: String, CodingKey {
    case url            = "url"
    case port           = "port"
    case httpsPort      = "https_port"
    case serverProtocol = "server_protocol"
    case rtmpPort       = "rtmp_port"
    case timezone       = "timezone"
    case timestampNow   = "timestamp_now"
    case timeNow        = "time_now"
    case process        = "process"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    url = try values.decodeIfPresent(String.self, forKey: .url)
    port = try values.decodeIfPresent(String.self, forKey: .port)
    httpsPort = try values.decodeIfPresent(String.self, forKey: .httpsPort)
    serverProtocol = try values.decodeIfPresent(String.self, forKey: .serverProtocol)
    rtmpPort = try values.decodeIfPresent(String.self, forKey: .rtmpPort)
    timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    timestampNow = try values.decodeIfPresent(Int.self, forKey: .timestampNow)
    timeNow = try values.decodeIfPresent(String.self, forKey: .timeNow)
    process = try values.decodeIfPresent(Bool.self, forKey: .process)
  }

  init() {
  }
}



struct UserInfo: Codable {
  var username             : String?   = nil
  var password             : String?   = nil
  var message              : String?   = nil
  var auth                 : Int?      = nil
  var status               : String?   = nil
  var expDate              : String?   = nil
  var isTrial              : String?   = nil
  var activeCons           : String?   = nil
  var createdAt            : String?   = nil
  var maxConnections       : String?   = nil
  var allowedOutputFormats : [String]? = []

  enum CodingKeys: String, CodingKey {
    case username             = "username"
    case password             = "password"
    case message              = "message"
    case auth                 = "auth"
    case status               = "status"
    case expDate              = "exp_date"
    case isTrial              = "is_trial"
    case activeCons           = "active_cons"
    case createdAt            = "created_at"
    case maxConnections       = "max_connections"
    case allowedOutputFormats = "allowed_output_formats"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    username = try values.decodeIfPresent(String.self, forKey: .username)
    password = try values.decodeIfPresent(String.self, forKey: .password)
    message = try values.decodeIfPresent(String.self, forKey: .message)
    auth = try values.decodeIfPresent(Int.self, forKey: .auth)
    status = try values.decodeIfPresent(String.self, forKey: .status)
    expDate = try values.decodeIfPresent(String.self, forKey: .expDate)
    isTrial = try values.decodeIfPresent(String.self, forKey: .isTrial)
    activeCons = try values.decodeIfPresent(String.self, forKey: .activeCons)
    createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
    maxConnections = try values.decodeIfPresent(String.self, forKey: .maxConnections)
    allowedOutputFormats = try values.decodeIfPresent([String].self, forKey: .allowedOutputFormats)
  }

  init() {
  }
}
