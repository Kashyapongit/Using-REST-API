//
//  ContentView.swift
//  Using API
//
//  Created by Sachin Kashyap on 12/06/21.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var resolveJSON = ResolveJSON()
    
    var body: some View {
        
        NavigationView {
            List(resolveJSON.posts) { post in
                HStack {
                    Text(post.title)
                    
                }
            }
            .navigationTitle("Title")
        }
        
        
        .onAppear {
            resolveJSON.fetchData()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




