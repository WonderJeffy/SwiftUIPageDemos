///
//  @filename   Item.swift
//  @package    SwiftUIPageDemos
//
//  @author     jeffy
//  @date       2023/11/30
//  @abstract
//
//  Copyright © 2023 and Confidential to jeffy All rights reserved.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
