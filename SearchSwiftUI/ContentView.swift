//
//  ContentView.swift
//  SearchSwiftUI
//
//  Created by Dawid Kubicki on 20/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack{
                    TextField("Search item", text: $searchText)
                }
                ForEach(0..<20, id: \.self) { num in
                    HStack{
                        Text("\(num)")
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.leading)
                }
            }
            .navigationTitle("Food")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
