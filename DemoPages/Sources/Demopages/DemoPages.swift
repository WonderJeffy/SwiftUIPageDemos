///
//  @filename   DemoPages.swift
//  @package    SwiftUIPageDemos
//
//  @author     jeffy
//  @date       2023/11/30
//  @abstract
//
//  Copyright © 2023 and Confidential to jeffy All rights reserved.
//

import I18NResource
import SwiftUI

public struct DemoPages: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                DemoItem()
            }
            .navigationTitle(Text("APP_NAME", bundle: .i18n))
        }
        
    }
}

struct DemoItem: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("title")
                .font(.title3)
                .fontWeight(.medium)
            Text("content")
                .font(.body)
        }
    }
}

#Preview {
    DemoPages()
}
