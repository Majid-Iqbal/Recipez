//
//  RecipeCell.swift
//  MyRecipezz
//
//  Created by Majid on 22/12/2016.
//  Copyright © 2016 Majid. All rights reserved.
//

import UIKit
import CoreData

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle :UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeImage.layer.cornerRadius = recipeImage.frame.size.width/2
        recipeImage.clipsToBounds  = true
     
    }

    func configureCell(recipe:Recipe){
      
         recipeTitle.text = recipe.title
         recipeImage.image = recipe.getRecipeImage()
        
        
        
    }
    


}
