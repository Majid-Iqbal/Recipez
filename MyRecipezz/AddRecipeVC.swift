//
//  AddRecipeVC.swift
//  MyRecipezz
//
//  Created by Majid on 22/12/2016.
//  Copyright © 2016 Majid. All rights reserved.
//

import UIKit
import CoreData

class AddRecipeVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         imagePicker = UIImagePickerController()
         imagePicker.delegate = self

        
//        recipeImage.layer.cornerRadius = recipeImage.frame.size.width/2
//        recipeImage.clipsToBounds = true
        
    }

 
    @IBAction func CreateAndSaveRecipe(_ sender: Any) {
        
        if let title =  recipeTitle.text, title != "" {
        
        let app = UIApplication.shared.delegate as? AppDelegate
        let context = app?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context!)
        
        let recipe = Recipe(entity: entity!, insertInto: context)
        
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(image: recipeImage.image!)
        
           context?.insert(recipe)
            
            do {
                
               try context?.save()
            }
            catch {
                
                print("not saved")
            }
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
        
    }

    @IBAction func addImage(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        recipeImage.image = image
        dismiss(animated: true, completion: nil)
        
    }
}
