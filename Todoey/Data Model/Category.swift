//
//  Category.swift
//  Todoey
//
//  Created by George on 4/19/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
