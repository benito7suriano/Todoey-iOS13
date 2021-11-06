//
//  Item.swift
//  Todoey
//
//  Created by Beno Suriano on 6/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

class Item: Encodable {
    let title: String
    var checked: Bool
    
    init(title itemTitle:String) {
        self.title = itemTitle
        self.checked = false
    }
}
