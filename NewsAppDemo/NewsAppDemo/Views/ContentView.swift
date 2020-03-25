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
        NewsListView()
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor.red

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = UIColor.red

        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.backgroundColor = UIColor.red

        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        navigationBar.compactAppearance = compactAppearance
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
