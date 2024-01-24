///
//  @filename   CustomTabbarView.swift
//  @package
//
//  @author     jeffy
//  @date       2024/1/24
//  @abstract
//
//  Copyright © 2024 and Confidential to jeffy All rights reserved.
//

import SwiftUI

struct CustomTabbarView: View {
    init() {
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.selected.iconColor = .systemPink

        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.shadowColor = .lightGray

        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                Image(systemName: "2.square")
//                    .resizable()
//                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .tag(0)
                Text("1")
                    .tag(1)
                List {
                    ForEach(0 ..< 100) { index in
                        Text("\(index)")
                    }
                }.tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            CustomTabBar(selectedTab: $selectedTab)
        }.ignoresSafeArea()
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    private func tabItemView(_ index: Int, systemName: String, title: String) -> some View {
        VStack(spacing: 0) {
            Image(systemName: systemName)
                .font(.system(size: 20))
                .padding(8)
            Text(title)
                .font(.system(size: 10))
        }
        .foregroundColor(selectedTab == index ? .white : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selectedTab == index ? Color.red.opacity(0.2) : Color.clear)
        .cornerRadius(10)
        .onTapGesture(perform: {
            selectedTab = index
        })
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 126)
                .background(Color(red: 0.19, green: 0.27, blue: 0.31))
                .cornerRadius(25)
                .offset(x: 0, y: 0)
            HStack(alignment: .center) {
                Spacer()
                tabItemView(0, systemName: "house", title: "home")
                Spacer()
                tabItemView(1, systemName: "house", title: "home")
                Spacer()
                tabItemView(2, systemName: "house", title: "home")
                Spacer()
            }
        }
    }
}

#Preview {
    CustomTabbarView()
}
