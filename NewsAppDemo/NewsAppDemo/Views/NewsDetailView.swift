//
//  NewsDetailView.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-17.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct NewsDetailView: View {
    
    let urlString: String?
    
    var body: some View {
        WebView(urlString: urlString)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(urlString: "https://www.apple.ca")
    }
}
