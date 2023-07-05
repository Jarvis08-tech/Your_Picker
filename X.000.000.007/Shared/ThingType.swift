//
//  ThingType.swift
//  X.000.000.007
//
//  Created by Develop on 19.03.22.
//

import Foundation

struct ThingType: Identifiable {
    let id: UUID
    let thing: String
    
    init(id: UUID = UUID(), thing: String) {
        self.id = id
        self.thing = thing
    }
}
