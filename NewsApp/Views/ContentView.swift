//
//  ContentView.swift
//  NewsApp
//
//  Created by Lado Rayhan on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
                    List(networkManager.posts) { post in
                        NavigationLink(destination: DetailView(link: post.link)) {
                                Text(post.title)
                        }
                    }
                    .navigationBarTitle("Rayn News")
                }
                .onAppear {
                    self.networkManager.fetchData()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
