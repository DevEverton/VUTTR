//
//  Tool.swift
//  VUTTR
//
//  Created by Everton Carneiro on 18/03/21.
//

import Foundation

struct Tool: Codable, Identifiable {
    var id: Int?
    var title: String
    var link: String?
    var description: String
    var tags: [String]
    
}
