//
//  CustomTabBarUI.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 2/05/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case movies
    case info
}

struct CustomTabBarUI: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomTabBarUI_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarUI(selectedTab: .constant(.movies))
    }
}
