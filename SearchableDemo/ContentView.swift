//
//  ContentView.swift
//  SearchableDemo
//
//  Created by Davide Troise with Swift 5.0
//  for the YouTube channel "Coding con Davide" https://bit.ly/3QJziJE
//

import SwiftUI

struct ContentView: View {
    let fruits = ["Apple", "Orange", "Banana", "Strawberry", "Lemon", "Grape", "Blueberry", "Mango"]
    
    @State private var searchText: String = ""
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(searchResults, id: \.self) { fruit in
                Text(fruit)
            }
            .navigationTitle("Fruits")
        }
        .searchable(text: $searchText, prompt: "Type a fruit")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
