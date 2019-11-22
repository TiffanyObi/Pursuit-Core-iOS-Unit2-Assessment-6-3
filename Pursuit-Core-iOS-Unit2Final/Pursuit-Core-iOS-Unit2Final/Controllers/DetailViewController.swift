//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Tiffany Obi on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var displayCrayonColor: UIView!
    
    @IBOutlet weak var crayonNameLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    
    @IBOutlet weak var alphaValueStepper: UIStepper!
    
    @IBOutlet weak var displayStepperValue: UILabel!
    
    var colors = [Crayon]()
    //Crayon.allTheCrayons
    
    var defaultColor = UIColor.clear
    
    var alphaValue: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
        updateUI()
        

    }
    
    func configureSlider(){
        redSlider.maximumValue = 1
        redSlider.minimumValue = 0
        
        redSlider.value = 0.5
        
        blueSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.value = 0.5
        
        greenSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.value = 0.5
    }
    
    func configureStepper(){
        alphaValueStepper.maximumValue = 1.0
        
        alphaValueStepper.minimumValue = 0.0
        
        alphaValueStepper.stepValue = 0.1
        
        alphaValueStepper.value = 1.0
        
    }
    
    func updateUI(){
        
        let selectedColor = colors
           
           for background  in selectedColor {
               
               displayCrayonColor.backgroundColor = UIColor(displayP3Red: CGFloat(background.red), green: CGFloat(background.green), blue: CGFloat(background.blue), alpha: 1)
               crayonNameLabel.text = background.name
               redLabel.text = "Red Value: loading... "
               blueLabel.text = "Blue Value: loading... "
               greenLabel.text = "Green Value: loading... "
               commentLabel.text = " Wonder which you choose first! "
           }
        
        defaultColor = displayCrayonColor.backgroundColor!
        }
        

    
    @IBAction func alphaStepperValueChanged(_ sender: UIStepper) {
        
        let colorss = colors
        
        alphaValue = CGFloat(alphaValueStepper.value)
        for color in colorss { displayCrayonColor.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.green), alpha: alphaValue)
            displayStepperValue.text = "Alpha Value: \(alphaValue)"
        }
    }
    
    @IBAction func redValueChanged(_ sender: UISlider) {
        var redColor = 0.0
        
        for color in colors {
            
            color.red = Double(sender.value)
            redColor = color.red
            
            
            
            displayCrayonColor.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: alphaValue)
            
            
        }
        
        redLabel.text = "Red Value: \(sender.value)"
        commentLabel.text = "Red Madness!"
    }
    
    @IBAction func blueValueChanged(_ sender: UISlider) {
        var blueColor = 0.0
        
        for color in colors {
            
            color.blue = Double(sender.value)
            blueColor = color.blue
            
            
            
            displayCrayonColor.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(blueColor), alpha: alphaValue)
        }
        blueLabel.text = "Blue Value: \(sender.value)"
        commentLabel.text = "Blue is Rocking!"
    }
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        var greenColor = 0.0
        
        for color in colors {
            
            color.green = Double(sender.value)
            greenColor = color.green
            
            
            
            displayCrayonColor.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(greenColor), blue: CGFloat(color.blue), alpha: alphaValue)
        }
        greenLabel.text = "Green Value: \(sender.value)"
        commentLabel.text = "Money Green!"
    }
    
    @IBAction func resetSettings(_ sender: UIButton) {
        
        configureStepper()
        configureSlider()
        displayCrayonColor.backgroundColor = defaultColor

}


}
