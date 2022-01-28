//
//  Cloud.swift
//  BigBrainStorm
//
//  Created by Mateusz Zwierzchowski on 18/12/2021.
//

import Foundation
import SwiftUI

struct Node: Decodable, Identifiable {
    enum CodingKeys: CodingKey {
        case id, x, y, text, red, green, blue, shape
    }
    
    public let id: Int 
    public var x: Double
    public var y: Double
    public var text: String
    public var red: Int
    public var green: Int
    public var blue: Int
    public var shape: Int
    public var offsetX: Double = 0
    public var offsetY: Double = 0
    public var colors = [[0,0,0],["Black"]]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        x = try container.decode(Double.self, forKey: .x)
        y = try container.decode(Double.self, forKey: .y)
        text = try container.decode(String.self, forKey: .text)
        red = try container.decode(Int.self, forKey: .red)
        green = try container.decode(Int.self, forKey: .green)
        blue = try container.decode(Int.self, forKey: .blue)
        shape = try container.decode(Int.self, forKey: .shape)
    }
}
    
extension Node {
    func circle() -> some View {
        Circle()
            .fill(Color(red: Double(red)/255.0, green: Double(green)/255.0, blue: Double(blue)/255.0))
            .frame(width: 64, height: 64, alignment: .center)
            .position(x: x + offsetX, y: y + offsetY)
    }
    
    func square() -> some View {
        Rectangle()
            .fill(Color(red: Double(red)/255.0, green: Double(green)/255.0, blue: Double(blue)/255.0))
            .frame(width: 64, height: 64, alignment: .center)
            .position(x: x + offsetX, y: y + offsetY)
    }
    
    @ViewBuilder func drawShape() -> some View {
        switch shape{
        case 1: circle(); label()
        case 2: square(); label()
            default: Text("Failed")
        }
    }
    
    func label() -> some View {
        return Text(text)
            .font(.system(size: 30))
            .bold()
            .position(x: x + offsetX, y: y + offsetY)
            .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
    }
}
