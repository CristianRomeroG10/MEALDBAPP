//
//  SearchMeals.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 03/10/23.
//

import Foundation

struct SearchMeals: Codable{
    let meals: [SearchItem]
    
    
    enum CodingKeys: String, CodingKey{
        case meals
    }
}
