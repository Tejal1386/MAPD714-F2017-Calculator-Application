/*
 Name: Tejal Patel
 Date: 21st September 2017
 StudentID: 300972812
 Discription: Simple Calculator Application
 Version 0.3: Add more functionality
 */

import UIKit

class ViewController: UIViewController {

    //-------------------------  variables -------------------------
    var displayNumber:Double = 0
    var resultNumber:Double = 0
    var finalnumber: Double = 0.0
    var isDecimal:Bool = false
    var sign: String=""
    var operation: Bool = false;
    
    
    
    //-------------------------  Outlets -------------------------
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    //-------------------------  Inherited Methods-------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.adjustsFontSizeToFitWidth = true;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    //-------------------------  Action Methods-------------------------
    

    @IBAction func numberButton(_ sender: UIButton) {
       
        if displayLabel.text == "0" {
                displayLabel.text = ""
        }
        
      if resultNumber == 0 && operation == false
      {
            if displayLabel.text == "+" {
                displayLabel.text = String(sender.tag)
            }else  if displayLabel.text == "-" {
                displayLabel.text = String(sender.tag)
            }else  if displayLabel.text == "x" {
                displayLabel.text = String(sender.tag)
            }else  if displayLabel.text == "÷" {
                displayLabel.text = String(sender.tag)
            }else if sender.tag == 18  {
                
                if isDecimal == false
                {
                    isDecimal = true
                    
                   
                    if displayLabel.text == ""
                    {
                        displayNumber = Double("0" + ".")!
                        displayLabel.text = String(displayNumber)
                    
                    }else{
                        displayNumber = Double(displayLabel.text! + ".")!
                        displayLabel.text = String(displayNumber)
                    }
                }
            }
            else {
                displayLabel.text = displayLabel.text! + String(sender.tag)
            }
        }else if operation == true {
        
            displayLabel.text = String(sender.tag)
            resultNumber = 0;
            operation = false;
            if isDecimal == false {
                isDecimal = true
                displayNumber = Double("0" + ".")!
                displayLabel.text = String(displayNumber)
            }
        }
        
    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        
        // = = 10
        // + = 11
        // - = 12
        // * = 13
        // ÷ = 14
        // % = 15
        // +/- = 16
        // AC = 17
        
        if displayLabel.text != "" {
            if sender.tag == 11 {
                
                displayNumber = Double(displayLabel.text!)!
                sign = "+"
                displayLabel.text = "+"
                
            } else if sender.tag == 12 {
                
                displayNumber = Double(displayLabel.text!)!
                sign = "-"
                displayLabel.text = "-"
            }else if sender.tag == 13 {
               
                displayNumber = Double(displayLabel.text!)!
                sign = "x"
                displayLabel.text = "x"
            }else if sender.tag == 14 {
               
                displayNumber = Double(displayLabel.text!)!
                sign = "÷"
                displayLabel.text = "÷"
            }else if sender.tag == 15 {
               
                //displayNumber = Double(displayLabel.text!)!
                //sign = "+"
                //displayLabel.text = "+"
            }else if sender.tag == 16 {
              
                //displayNumber = Double(displayLabel.text!)!
                //sign = "+"
                //displayLabel.text = "+"
            }else if sender.tag == 17 {
                
                displayNumber = 0
                finalnumber = 0
                sign = ""
                displayLabel.text = "0"
            }else if sender.tag == 10 {
               
                if displayNumber != 0 {
                    
                    if displayLabel.text == "+" || displayLabel.text == "-" || displayLabel.text == "x" || displayLabel.text == "÷" {
                        finalnumber = displayNumber ;
                    }else{
                    
                        finalnumber = Double(displayLabel.text!)!
                    }
                    
                    if finalnumber != 0 {
                    
                        if sign == "+"{
                            resultNumber = displayNumber + finalnumber
                            displayLabel.text = String(resultNumber)
                        }else if sign == "-"{
                            resultNumber = displayNumber - finalnumber
                            displayLabel.text = String(resultNumber)
                        }else if sign == "x"{
                            resultNumber = displayNumber * finalnumber
                            displayLabel.text = String(resultNumber)
                        }else if sign == "÷"{
                            resultNumber = displayNumber / finalnumber
                            displayLabel.text = String(resultNumber)
                        }
                    }
                    
                }
            }
        
        
        }
        
        operation = true
        isDecimal = false
        
    }
    
}

