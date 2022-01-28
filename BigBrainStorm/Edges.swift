//
//  Edges.swift
//  BigBrainStorm
//
//  Created by Mateusz Zwierzchowski on 19/12/2021.
//

import Foundation
import SwiftUI

class Edges {
    public let e_array: [Edge]

    init() {
        let url = Bundle.main.url(forResource: "edges", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        e_array = try! JSONDecoder().decode([Edge].self, from: data)
    }
}
