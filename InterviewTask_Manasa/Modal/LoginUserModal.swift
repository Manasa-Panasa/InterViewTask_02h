//
//  LoginUserModal.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

//import Foundation
import GoogleSignIn

//struct GoogleLoginResponse {
//    let userID:String?
//    let name:String?
//    let email:String?
//    let imageURL:URL?
//}
//class GoogleLoginResManager {
//    static let shared = GoogleLoginResManager()
//    var googleLoginResponse: GoogleLoginResponse?
//    private init() {
//    }
//}

import Foundation

struct GoogleLoginResponse {
    let userID: String?
    let name: String?
    let email: String?
    let imageURL: URL?
}

class GoogleLoginResManager {
    static let shared = GoogleLoginResManager()

    private let userDefaults = UserDefaults.standard
    private let userIDKey = "googleLoginResponseUserID"
    private let nameKey = "googleLoginResponseName"
    private let emailKey = "googleLoginResponseEmail"
    private let imageURLKey = "googleLoginResponseImageURL"

    var googleLoginResponse: GoogleLoginResponse? {
        get {
            let userID = userDefaults.string(forKey: userIDKey)
            let name = userDefaults.string(forKey: nameKey)
            let email = userDefaults.string(forKey: emailKey)
            let imageURLString = userDefaults.string(forKey: imageURLKey)
            let imageURL = imageURLString.flatMap { URL(string: $0) }

            return GoogleLoginResponse(userID: userID, name: name, email: email, imageURL: imageURL)
        }
        set {
            userDefaults.set(newValue?.userID, forKey: userIDKey)
            userDefaults.set(newValue?.name, forKey: nameKey)
            userDefaults.set(newValue?.email, forKey: emailKey)
            userDefaults.set(newValue?.imageURL?.absoluteString, forKey: imageURLKey)
        }
    }

    private init() {}
}

// Example Usage:

//// Save GoogleLoginResponse
//let response = GoogleLoginResponse(userID: "123", name: "John", email: "john@example.com", imageURL: URL(string: "https://example.com/image.jpg"))
//GoogleLoginResManager.shared.googleLoginResponse = response
//
//// Fetch GoogleLoginResponse
//if let savedResponse = GoogleLoginResManager.shared.googleLoginResponse {
//    print("User ID: \(savedResponse.userID ?? "N/A")")
//    print("Name: \(savedResponse.name ?? "N/A")")
//    print("Email: \(savedResponse.email ?? "N/A")")
//    print("Image URL: \(savedResponse.imageURL?.absoluteString ?? "N/A")")
//} else {
//    print("No saved response.")
//}

