//
//  ViewController.swift
//  MyRecipezz
//
//  Created by Majid on 22/12/2016.
//  Copyright © 2016 Majid. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView :UITableView!
    
     var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        fetchAndSetResults()
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeCell {
            
            let recipe = recipes[indexPath.row]
            
            cell.configureCell(recipe: recipe)
            
            return cell
        }else {
            
            return RecipeCell()
        }
}
  
    func fetchAndSetResults(){
        
        let app = UIApplication.shared.delegate as? AppDelegate
        let context = app?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        
        do{
            let fetchResults = try context?.fetch(fetchRequest)
                self.recipes = fetchResults as! [Recipe]
            
        }
        catch let err as NSError{
            
            print(err.debugDescription)
        }
        
            
            
        }
        
        
    }


