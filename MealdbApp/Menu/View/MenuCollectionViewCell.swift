//
//  MenuCollectionViewCell.swift
//  MealdbApp
//
//  Created by Cristian guillermo Romero garcia on 02/10/23.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    //MAR: Outlets
    
    @IBOutlet weak var desertImage: UIImageView!
    @IBOutlet weak var nameDesertLabel: UILabel!
    

    
    func displayImage(image: UIImage){
        self.desertImage.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
