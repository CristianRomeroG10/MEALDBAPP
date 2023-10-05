//
//  MenuViewController.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import UIKit

class MenuViewController: UIViewController, MenuViewProtocol {
   
    
    
    var searchItem: [SearchItem] = []
    var presenter: MenuPresenterProtocol?
    
    //MARK: outlets
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    func setupUI() {
        loaderView.isHidden = true
    }
    
    func animateLoader(isAnimating: Bool) {
        DispatchQueue.main.async{
            self.loaderView.isHidden = !isAnimating
            if isAnimating{
                self.loaderView.startAnimating()
            }else{
                self.loaderView.stopAnimating()
            }
        }
    }
    
    func displayMenuInfo(searchItem: [SearchItem]) {
        DispatchQueue.main.async{
            self.searchItem = searchItem
            self.menuCollectionView.reloadData()
        }
    }
    
    
    func setUpCollectionView(){
        menuCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MenuCollectionViewCell")
        menuCollectionView.dataSource = self
        
    }
    
    
    func displayImage(image: UIImage){
        DispatchQueue.main.async{
            let menuCollectionViewcell = MenuCollectionViewCell()
            menuCollectionViewcell.desertImage.image = image
            
        }
    }
    
}

extension MenuViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as? MenuCollectionViewCell{
            let item = searchItem[indexPath.row]
            // Configura la celda con los datos del elemento
            cell.nameDesertLabel.text = item.name
            
            // También puedes cargar la imagen aquí si corresponde
            return cell
        }
        return UICollectionViewCell()
    }
}
