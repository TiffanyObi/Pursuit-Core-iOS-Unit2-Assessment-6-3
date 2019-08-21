//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "colors", for: indexPath)
        
        cell.textLabel?.text = Crayon.allTheCrayons[indexPath.row].name
        cell.detailTextLabel?.text = Crayon.allTheCrayons[indexPath.row].hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat((Crayon.allTheCrayons[indexPath.row].red/255)), green: CGFloat((Crayon.allTheCrayons[indexPath.row].green/255)), blue: CGFloat((Crayon.allTheCrayons[indexPath.row].blue/255)), alpha: CGFloat(0.5))
        
        return cell
    }
    
    
    
    

    @IBOutlet weak var tableOutlet: UITableView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableOutlet.dataSource = self
    tableOutlet.delegate = self
  }


}

