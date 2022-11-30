//
//  AppError.swift
//  Yummie
//
//  Created by User on 30/11/22.
//

import Foundation

enum AppError: LocalizedError{
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String?{
        switch self{
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Bro, I don't have any idea what is going on."
        case .invalidUrl:
            return "Hey, give a valid url"
        case .serverError( let error):
            return error
        }
    }
}
