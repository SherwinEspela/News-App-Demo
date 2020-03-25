//
//  NewsCell.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-17.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct NewsCell: View {
    
    let urlString: String?
    let id: String
    let title: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                
                Image("testImage")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 7) {
                    Spacer()
                    
                    Text("BREAKING NEWS")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(4)
                        .foregroundColor(.white)
                        .background(Color.red)
                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.title)

                }.padding(20)
                
                NavigationLink(destination: NewsDetailView(urlString: urlString)) {
                    EmptyView()
                }.buttonStyle(PlainButtonStyle())
            }
            
            ActionArea()
        }
    }
}

struct ActionAreaButton: View {
    
    let iconName: String
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.callout)
                .foregroundColor(.black)
        }
        
        .padding(10)
    }
}

struct ActionArea: View {
    
    var body: some View {
        HStack {
            Text("2h")
                .font(.callout)
                .foregroundColor(.red)
                .padding(.leading)
            Spacer()
            ActionAreaButton(iconName: "square.and.arrow.up", action: {})
            ActionAreaButton(iconName: "bookmark", action: {}).padding(.trailing)
        }
        .frame(height: 50)
        .background(Color.clear)
        .padding(EdgeInsets(top: -5, leading: 0, bottom: -5, trailing: 0))
        
        .onTapGesture {
            // disables tap gesture on Action Area
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(urlString: "urlString", id: "id", title: "slkfjsd slkjdf slkjsdf sdlfjs fsfsjfjls")
            .previewLayout(.sizeThatFits)
    }
}
