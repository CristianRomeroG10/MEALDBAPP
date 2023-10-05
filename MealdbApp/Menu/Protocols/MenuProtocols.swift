//
//  MenuProtocols.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import Foundation
import UIKit

protocol MenuViewProtocol: AnyObject{
    //MARK: VIPER properties
    var presenter: MenuPresenterProtocol? {get set}
    //MARK: Presenter -> View
    func setupUI()
    func animateLoader(isAnimating: Bool)
    func displayMenuInfo(searchItem: [SearchItem])
    func displayImage(image: UIImage)
}

protocol MenuPresenterProtocol: AnyObject{
    //MARK: VIPER Properties
    var view: MenuViewProtocol? {get set}
    var interactor: MenuInteractorInputProtocol? {get set}
    var wireframe: MenuWireFrameProtocol? {get set}
    
    //MARK: View -> presenter
    func viewDidLoad()
}

protocol MenuInteractorInputProtocol: AnyObject{
    //MARK: VIPER Properties
    var presenter: MenuInteractorOutputProtocol? {get set}
    
    //MARK: Presenter -> Interactor
    func fetchMenuInfo()
}

protocol MenuWireFrameProtocol: AnyObject{
    
    //MARK: Static Methods
    static func getMenuModule() -> UIViewController
    
    //Mark:Presenter -> WireFrame
}

protocol MenuInteractorOutputProtocol: Any{
    //MARK: Interactor -> presenter
    func didGetMenuInfo(searchItem: [SearchItem])
    func didGetImage(image: UIImage)
}
