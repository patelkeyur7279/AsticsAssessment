//
//  StructUniversity.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import Foundation

struct StructUniversity: Codable {
    
    let webPages: [String]?
    let stateProvince: String?
    let alphaTwoCode: String?
    let name: String?
    let country: String?
    let domains: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case webPages = "web_pages"
        case stateProvince = "state-province"
        case alphaTwoCode = "alpha_two_code"
        case name
        case country
        case domains
    }
    
}
