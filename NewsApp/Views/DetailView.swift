//
//  DetailView.swift
//  NewsApp
//
//  Created by Lado Rayhan on 28/03/23.
//

import SwiftUI

struct DetailView: View {
    
    let link: String?
    
    var body: some View {
        WebView(urlString: link)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(link: "https://www.google.com")
    }
}
