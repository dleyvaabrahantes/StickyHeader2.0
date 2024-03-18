//
//  Item.swift
//  StickyHeader2.0
//
//  Created by David on 3/18/24.
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
