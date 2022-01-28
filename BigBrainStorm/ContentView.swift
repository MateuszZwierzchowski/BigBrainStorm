//
//  ContentView.swift
//  BigBrainStorm
//
//  Created by Mateusz Zwierzchowski on 18/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nodes = Nodes()
    @State var matrix = Matrix()
    @State var showSidebar: Bool = false
    @State var id = 0
    @State var tab = [0.0,0.1,0.2]
    
    var body: some View {
        
        SideBarStack(sidebarWidth: 200, showSidebar: $showSidebar) {
            NavigationView{
                VStack(){
                    Form {
                        Section {
                            TextField("\(nodes.n_array[id].text)", text: $nodes.n_array[id].text)
                            } header: { Text("Tekst") }
                        
                        Section {
                                Picker("Czerwony", selection: $nodes.n_array[id].red) {
                                    
                                    ForEach(0...255, id: \.self) { red in
                                        Text("\(red)")
                                    }
                                    
                                }
                                
                                
                                Picker("Zielony", selection: $nodes.n_array[id].green) {
                                    
                                    ForEach(0...255, id: \.self) { green in
                                        Text("\(green)")
                                    }
                                    
                                }
                                
                                Picker("Niebieski", selection: $nodes.n_array[id].blue) {
                                    
                                    ForEach(0...255, id: \.self) { blue in
                                        Text("\(blue)")
                                    }
                                    
                                }
                            
                        } header: { Text("Kolor") }
                             
                    }
                    HStack(){
                    
                        
                        Button(action:
                                {
                            
                        }) {
                            
                            Text("Usuń")
                                .fontWeight(.bold)
                                .font(.body)
                                .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        
                    }
                }
                }
            
                } content: {
                    ZStack{
                        ZStack {
                            ForEach(0..<matrix.arr.count) { x in
                                ForEach(0..<matrix.arr[x].count) { y in
                                    if matrix.arr[x][y] == 1 {
                                        makeLine(from: nodes.n_array[x], to: nodes.n_array[y])
                                    }
                                }
                            }
                            
                            
                            ForEach($nodes.n_array) { $node in
                                node.drawShape()
                                    .gesture(DragGesture()
                                        .onChanged { value in
                                            node.offsetX = value.translation.width
                                            node.offsetY = value.translation.height
                                        }
                                        .onEnded { value in
                                            node.x += node.offsetX
                                            node.y += node.offsetY
                                            node.offsetX = 0
                                            node.offsetY = 0
                                        }
                                    )
                                    .onTapGesture(count: 2){
                                        withAnimation{
                                            showSidebar = true
                                            id = node.id
                                        }
                                    }
                            }
                        }
                        }
                    Button(action:
                            {
                        
                    }) {
                        Text("Zapisz")
                            .fontWeight(.bold)
                            .font(.body)
                            .padding(8)
                            .background(Color.green)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                    .position(x: UIScreen.main.bounds.width * 69/100, y: 20)
                    
                    Button(action:
                            {
                        nodes.n_array.append(Node(from: Decoder) throws -> {
                            id = 6
                            x = 0
                            y = 0
                            text = "F"
                            red = 150
                            green = 150
                            blue = 150
                            shape = 1
                        })
                        
                    }) {
                        Text("Dodaj+")
                            .fontWeight(.bold)
                            .font(.body)
                            .padding(8)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                    .position(x: UIScreen.main.bounds.width * 89/100, y: 20)
                    
                }.edgesIgnoringSafeArea(.bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
