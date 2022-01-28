//
//  Nodes.swift
//  BigBrainStorm
//
//  Created by Mateusz Zwierzchowski on 19/12/2021.
//

import Foundation

class Nodes: ObservableObject {
   @Published var n_array = [Node]()

    init() {
        let url = Bundle.main.url(forResource: "nodes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        n_array = try! JSONDecoder().decode([Node].self, from: data)
    }
}


