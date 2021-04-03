//
//  ToolList.swift
//  VUTTR
//
//  Created by Everton Carneiro on 18/03/21.
//

import Combine
import Foundation

class Tools: ObservableObject {

    let toolsJSONURL = URL(fileURLWithPath: "ToolsList", relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
    
    @Published var isSearching = false
    
            
    @Published var list = [
        Tool(
            title: "Notion",
            link: "https://notion.so",
            description: "All in one tool to organize teams and ideas. Write, plan, collaborate, and get organized. ",
            tags: [
                "organization",
                "planning",
                "collaboration",
                "writing",
                "calendar"
            ]
        ),
        Tool(
            title: "json-server",
            link: "https://github.com/typicode/json-server",
            description: "Fake REST API based on a json schema. Useful for mocking and creating APIs for front-end devs to consume in coding challenges.",
            tags: [
                "api",
                "json",
                "schema",
                "node",
                "github",
                "rest"
            ]

        ),
        Tool(
            title: "fastify",
            link: "https://www.fastify.io/",
            description: "Extremely fast and simple, low-overhead web framework for NodeJS. Supports HTTP2.",
            tags: [
                "web",
                "framework",
                "node",
                "http2",
                "https",
                "localhost"
            ]
            
        )
        
    ]
    {
        didSet {
            if !isSearching {
                saveJSONToolsList()
            }
        }
    }

    init() {
        loadJSONToolsList()
    }
    
    private func loadJSONToolsList() {
        guard FileManager.default.fileExists(atPath: toolsJSONURL.path) else { return }
        
//        let filePath = FileManager.documentsDirectoryURL.path
//        print(filePath)

        let decoder = JSONDecoder()
        
        do {
            let toolsData = try Data(contentsOf: toolsJSONURL)
            list = try decoder.decode([Tool].self, from: toolsData)
        } catch let error {
            print(error)
        }
    }
    
    private func saveJSONToolsList() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let toolsData = try encoder.encode(list)
            try toolsData.write(to: toolsJSONURL, options: .atomicWrite)
        } catch let error {
            print(error)
        }
    }
    
    func addTool(title: String, link: String, description: String, tags: [String]) {
        let tool = Tool(title: title, link: link, description: description, tags: tags)
        list.append(tool)
        

    }
    
    func getIndexOf(title: String) -> Int {
        
        var toolIndex: Int
        
        for (index, element) in list.enumerated() {
            if element.title == title {
                toolIndex = index
                return toolIndex
            }
        }
        return 0
    }
    
    func deleteTool(at index: Int) {
        list.remove(at: index)
    }
    
    
    func edit(withIndex index: Int, name: String, link: String, description: String, tags: [String] ) {
        list[index].title = name
        list[index].link = link
        list[index].description = description
        list[index].tags = tags
    }
    
    func search(_ text: String) {
        
        let isSearchingByTag = text.starts(with: "#")
        isSearching = true
        loadJSONToolsList()
        
        var newList = [Tool]()
        var newText = text
        
        if text.isEmpty {
            isSearching = false
        }
        else {
            if isSearchingByTag {
                newText.remove(at: text.startIndex)
                for tool in list {
                    if tool.tags.reduce("", {$0 + $1}).contains(newText) {
                        newList.append(tool)
                    }
                }
                if !newText.isEmpty {
                    list = newList
                }

            } else {
                list = list.filter { $0.title.lc().contains(text.lc()) }
            }
        }
    }
}

extension String {
    func lc() -> String {
        self.lowercased()
    }
}



public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}

























//MARK: - Mock Data for testing

//class ToolList: ObservableObject {
//    @Published var list: [Tool] = [
//        Tool(id: 1,
//             title: "Notion",
//             link: "https://notion.so",
//             description: "All in one tool to organize teams and ideas. Write, plan, collaborate, and get organized. ",
//             tags: [
//                "organization",
//                "planning",
//                "collaboration",
//                "writing",
//                "calendar"
//             ]
//        ),
//        Tool(id: 2,
//             title: "json-server",
//             link: "https://github.com/typicode/json-server",
//             description: "Fake REST API based on a json schema. Useful for mocking and creating APIs for front-end devs to consume in coding challenges.",
//             tags: [
//                "api",
//                "json",
//                "schema",
//                "node",
//                "github",
//                "rest"
//             ]
//
//        ),
//        Tool(id: 3,
//             title: "fastify",
//             link: "https://www.fastify.io/",
//             description: "Extremely fast and simple, low-overhead web framework for NodeJS. Supports HTTP2.",
//             tags: [
//                "web",
//                "framework",
//                "node",
//                "http2",
//                "https",
//                "localhost"
//             ]
//
//        )
//
//    ]
//}
//
//
