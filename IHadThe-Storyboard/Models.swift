//
//  Models.swift
//  IHadThe
//
//  Created by William Pendleton on 10/19/24.
//

import Foundation

struct Restaurant {
    let name: String
    let menuItems: [MenuItem]
}

struct MenuItem {
    let name: String
    var reviews: [Review]
}

struct Review {
    let rating: Int // 1 to 5
    let text: String
}
