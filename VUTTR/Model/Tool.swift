//
//  Tool.swift
//  VUTTR
//
//  Created by Everton Carneiro on 18/03/21.
//

import Foundation

struct Tool: Identifiable, Codable {
    var id = UUID()
    let title: String
    let link: String
    let description: String
    let tags: [String]
}

