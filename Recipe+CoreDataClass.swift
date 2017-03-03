//
//  Recipe+CoreDataClass.swift
//  MyRecipezz
//
//  Created by Majid on 22/12/2016.
//  Copyright © 2016 Majid. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Recipe)
public class Recipe: NSManagedObject {
    
    func setRecipeImage(image:UIImage){
        
        let img = UIImagePNGRepresentation(image)
        self.image = img as NSData?
    }
    
    func getRecipeImage() -> UIImage { 
        
        let image = UIImage(data: self.image as! Data)
        
        return image!
    }

}
