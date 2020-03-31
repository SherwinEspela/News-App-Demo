//
//  NewsTag.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-30.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct NewsTag: View {
    
    let tagType: TagType
    
    var body: some View {
        return conditionalView()
    }
    
    private func conditionalView() -> AnyView {
        if tagType == .none {
            return AnyView(EmptyView())
        }
        
        return AnyView(
            Text(tagType.rawValue.uppercased())
                .font(.caption)
                .fontWeight(.semibold)
                .padding(setValue(forUniqueCase: 0, andDefaultCase: 4))
                .foregroundColor(.white)
                .background(setValue(forUniqueCase: Color.clear, andDefaultCase: Color.red))
        )
    }
    
    private func setValue<T>(forUniqueCase uniqueValue: T, andDefaultCase defaultValue: T) -> T {
        switch self.tagType {
        case .opinion, .factCheck, .analysis:
            return uniqueValue
        default:
            return defaultValue
        }
    }
}
