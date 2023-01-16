//
//  ServiceManager.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import Foundation
import Alamofire

class ServiceManager {
    
    static let shared = ServiceManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.waitsForConnectivity = true
        return Session(configuration: configuration)
    }()
    
}
