//
//  MenuWireframe.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import Foundation
import UIKit

class MenuWireframe: MenuWireFrameProtocol{
    static func getMenuModule() -> UIViewController {
        //Generate VIPER components
        let menuStoryboard = UIStoryboard(name: "MenuStoryboard", bundle: .main)
        let view = menuStoryboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        let wireframe = MenuWireframe()
        
        //Conecting
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        
        return view
    }
    
    
}
