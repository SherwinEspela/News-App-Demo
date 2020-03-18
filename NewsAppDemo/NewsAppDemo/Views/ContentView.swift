//
//  ContentView.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-15.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NewsListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
