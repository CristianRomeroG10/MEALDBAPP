//
//  MenuPrsenter.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import Foundation
import UIKit

class MenuPresenter: MenuPresenterProtocol, MenuInteractorOutputProtocol{
   
    
    
    var view: MenuViewProtocol?
    var interactor: MenuInteractorInputProtocol?
    var wireframe: MenuWireFrameProtocol?
    
    func viewDidLoad() {
        view?.setupUI()
        view?.animateLoader(isAnimating: true)
        interactor?.fetchMenuInfo()
        
    }
    func didGetMenuInfo(searchItem: [SearchItem]) {
        view?.displayMenuInfo(searchItem: searchItem)
    }
    
    func didGetImage(image: UIImage) {
        view?.displayImage(image: image)
        view?.animateLoader(isAnimating: false)
    }
    
}
