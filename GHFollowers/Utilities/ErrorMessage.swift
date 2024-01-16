//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Abdulla Ahmad on 1/16/24.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidUsername    = "This username create an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data recived from server was invalid, Please try again."
}
