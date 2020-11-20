//
//  ContentView.swift
//  SearchSwiftUI
//
//  Created by Dawid Kubicki on 20/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                
                SearchBarView(searchText: $searchText, isSearching: $isSearching)
                
                
                ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { num in
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

struct SearchBarView: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack{
            HStack{
                TextField("Search item", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(7.0)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                    
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.easeInOut)
            
            if isSearching {
                Button(action: {
                    
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, -7)
                })
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
            
        }
    }
}
