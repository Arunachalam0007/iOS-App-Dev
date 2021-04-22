//
//  ToDoCategory.swift
//  Sha Todo List
//
//  Created by ArunSha on 20/04/21.
//

import Foundation
import RealmSwift
class ToDoCategory: Object {
    @objc dynamic var name: String = ""
    // Forward RelationShip to ToListIem Class or Entity ( 1 to many)
    var toDOListItem = List<ToDoListItem>()
}
