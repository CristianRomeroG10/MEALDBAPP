//
//  MenuInteractor.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import Foundation
import UIKit

class MenuInteractor: MenuInteractorInputProtocol{
    var searchItem: [SearchItem] = []
    
    func fetchMenuInfo() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                self.decodeJsonResponse(data: data)
            }
            if let response = response {
                print("RESPONSE: \(response)")
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP CODE: \(httpResponse.statusCode)")
                }
            }
            if let error = error {
                print("ERROR: \(error)")
            }
        }
        task.resume()
    }
    
    private func decodeJsonResponse(data: Data){
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(SearchMeals.self, from: data)
            print("DECODED RESPONSE: \(response)")
            searchItem = response.meals
            self.presenter?.didGetMenuInfo(searchItem: searchItem)
            //reloadCollectionView()
            
        }catch{
            print("Error \(error)")
        }
//
        
        //self.presenter?.didGetMenuInfo(searchItem: searchItem)
        //self.fetchImage(url: )
    }
    
    private func fetchImage(url: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let image = UIImage(data: data) else { return }
                self.presenter?.didGetImage(image: image)
            }
        }
        task.resume()
    }
    
    var presenter: MenuInteractorOutputProtocol?

}
