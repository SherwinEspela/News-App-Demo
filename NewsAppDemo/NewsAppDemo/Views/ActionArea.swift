//
//  ActionArea.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-25.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct ActionArea: View {
    
    private var relativeDateString: String = ""
    
    init(dateCreatedString: String) {
        setRelativeDate(dateCreatedString)
    }
    
    private mutating func setRelativeDate(_ dateCreatedString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        // sample date: "2020-03-24T16:39:59.000Z"
        if let dateCreated = dateFormatter.date(from: dateCreatedString) {
            
            let relativeDateformatter = RelativeDateTimeFormatter()
            relativeDateformatter.unitsStyle = .full
            
            self.relativeDateString = relativeDateformatter.localizedString(for: dateCreated, relativeTo: Date())
        }
    }
    
    var body: some View {
        HStack {
            Text(self.relativeDateString)
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
