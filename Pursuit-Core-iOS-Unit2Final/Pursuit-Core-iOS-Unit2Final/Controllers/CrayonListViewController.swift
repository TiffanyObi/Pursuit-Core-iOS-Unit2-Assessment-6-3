//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var colors = [Crayon]() {
        didSet{
            tableView.reloadData()
        }
    }
 
  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
   Crayon.getSpecialColors()
    loadData()
    }

    
    
    func loadData(){
        colors = Crayon.allTheCrayons
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDisplay = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("could not locate VC")
        }
        let colorShowing = colors[indexPath.row]
        colorDisplay.colors = [colorShowing]
    }
   
}


extension CrayonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorCell = tableView.dequeueReusableCell(withIdentifier: "eachColorCell", for: indexPath)
        
        let colorInRow = colors[indexPath.row]
        
        
        colorCell.textLabel?.text = colorInRow.name
        
        if colorCell.textLabel?.text == "Black" {
            colorCell.textLabel?.textColor = .white
        }
        
        colorCell.detailTextLabel?.text = colorInRow.hex
        if colorCell.detailTextLabel?.text == "#000000" {
            colorCell.detailTextLabel?.textColor = .white
        }
        
        colorCell.backgroundColor = UIColor(displayP3Red: CGFloat(colorInRow.red), green: CGFloat(colorInRow.green), blue: CGFloat(colorInRow.blue), alpha: 1)
        print("My blue color is \(colorInRow.blue)")
        
        return colorCell
    }
    
    
}
