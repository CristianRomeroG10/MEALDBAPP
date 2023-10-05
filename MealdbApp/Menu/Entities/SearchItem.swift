//
//  MenuEntities.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import Foundation

struct SearchItem: Codable{
    var name: String?
    var menuImage: String?
}

enum CodingKeys: String, CodingKey{
    case name = "strMeal"
    case menuImahe = "strMealThumb"
}
