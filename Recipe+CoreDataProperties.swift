//
//  Recipe+CoreDataProperties.swift
//  MyRecipezz
//
//  Created by Majid on 22/12/2016.
//  Copyright © 2016 Majid. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var steps: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var title: String?

}
