///
//  @filename   Item.swift
//  @package   
//  
//  @author     jeffy
//  @date       2024/1/8 
//  @abstract   
//
//  Copyright (c) 2024 and Confidential to jeffy All rights reserved.
//

import Foundation
import SwiftData

@Model
final class Item {
    
    var timestamp: Date
    var name: String
    
    init(timestamp: Date, name: String) {
        self.timestamp = timestamp
        self.name = name
    }
}
