//
//  Matrix.swift
//  BigBrainStorm
//
//  Created by Mateusz Zwierzchowski on 19/12/2021.
//

import Foundation

class Matrix: ObservableObject {
    private let nodes = Nodes()
    private let edges = Edges()
    @Published var arr: [[Int]]

    init() {
        arr = Array(repeating: Array(repeating: 0, count: nodes.n_array.count), count: nodes.n_array.count)
        var x:Int, y: Int
        for i in 0...edges.e_array.count-1 {
            x = edges.e_array[i].n1
            y = edges.e_array[i].n2
            arr[x][y] = 1
        }
    }
}
