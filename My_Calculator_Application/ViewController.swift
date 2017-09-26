/*
 Name: Tejal Patel
 Date: 21st September 2017
 StudentID: 300972812
 Discription: Simple Calculator Application
 Version 0.3: Added functions for decimal point, % and +/-
 */

import UIKit

class ViewController: UIViewController {

    //-------------------------  variables -------------------------
    var displayNumber:Double = 0
    var resultNumber:Double = 0
    var finalnumber:Double = 0
    var isDecimal:Bool = false
    var sign: String=""
    var operation: Bool = false
    var searchCharacter: Character = "."
    var isnegative: Bool = false
    
    
    
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
        if displayLabel.text == "0.0"{
                displayLabel.text = "0."
        }
        
      if resultNumber == 0 && operation == false
      {
        
                displayLabel.text = displayLabel.text! + String(sender.tag)
      }
      else if operation == true {
        
            displayLabel.text = String(sender.tag)
            resultNumber = 0;
            operation = false;
        }
    }
    
    
    // decimal point button
    @IBAction func decimalButton(_ sender: UIButton) {
        
         if isDecimal == false
         {
                isDecimal = true
         
         
            let result = String(resultNumber)
            
            let characterset = CharacterSet(charactersIn: ".")
           
            if result.rangeOfCharacter(from: characterset.inverted) == nil {
                print("string contains special characters")
            }
            else if displayLabel.text == ""
                {
                    displayNumber = Double("0" + ".")!
                    displayLabel.text = String(displayNumber)
         
                }else  {
                    displayNumber = Double(displayLabel.text! + ".")!
                    displayLabel.text = displayLabel.text! + "."
                    
                }
         }
        
        isDecimal = true
    }
    
    // % button
    
    @IBAction func percentageButton(_ sender: UIButton) {
       
        
        if displayLabel.text != "" {
            
            if sign == "" {
                displayNumber = Double(displayLabel.text!)!
                finalnumber = 1
            }else
            {  finalnumber = Double(displayLabel.text!)!}
        
            resultNumber = ( displayNumber * finalnumber)/100
            displayLabel.text = String(resultNumber)
        }
        
    }
    
    
    // plus or minus function
    @IBAction func plus_minus_Button(_ sender: UIButton) {
        if isnegative == false
        { displayLabel.text = "-" + displayLabel.text!
        isnegative = true
        }
        else
        {
           
            var number = displayLabel.text!
            number.remove(at: number.startIndex)
            displayLabel.text = String(number)
            isnegative = false
        }
        
    }
    
    
    // arithmetic operation function
    @IBAction func operationButton(_ sender: UIButton) {
        
        // = = 10
        // + = 11
        // - = 12
        // * = 13
        // ÷ = 14
        // % = 15
        // +/- = 16
        // AC = 17
        
        if displayNumber != 0
        { finalnumber = Double(displayLabel.text!)!
            
        }
        
        if displayLabel.text != "" {
            if sender.tag == 11 {
                
                displayNumber = Double(displayLabel.text!)!
                sign = "+"
                if resultNumber != 0
                { resultNumber = displayNumber + finalnumber
                    displayLabel.text = String(resultNumber)
                }

                
            } else if sender.tag == 12 {
                
                displayNumber = Double(displayLabel.text!)!
                sign = "-"
                if resultNumber != 0
                { resultNumber = displayNumber - finalnumber
                    displayLabel.text = String(resultNumber)
                }
                

              
            }else if sender.tag == 13 {
               
                displayNumber = Double(displayLabel.text!)!
                sign = "x"
                if resultNumber != 0
                { resultNumber = displayNumber * finalnumber
                    displayLabel.text = String(resultNumber)
                }
                

            }else if sender.tag == 14 {
               
                displayNumber = Double(displayLabel.text!)!
                sign = "÷"
                if resultNumber != 0
                { resultNumber = displayNumber / finalnumber
                    displayLabel.text = String(resultNumber)
                }
                

            }else if sender.tag == 16 {
               
                // +/- button
                
            }else if sender.tag == 17 {
                resultNumber = 0
                displayNumber = 0
                finalnumber = 0
                sign = ""
                displayLabel.text = "0"
            }else if sender.tag == 10 {
               
                
                if displayNumber != 0 {
                    
                   
                        finalnumber = Double(displayLabel.text!)!
                    
                    
                    if finalnumber != 0 {
                    
                        if sign == "+"{
                            resultNumber = displayNumber + finalnumber
                           
                        }else if sign == "-"{
                            resultNumber = displayNumber - finalnumber
                            
                        }else if sign == "x"{
                            resultNumber = displayNumber * finalnumber
                           
                        }else if sign == "÷"{
                            resultNumber = displayNumber / finalnumber
                            
                        }
                        displayLabel.text = String(resultNumber)
                    }
                    
                }
            }
        
        
        }
        
        operation = true
        isDecimal = false
        
    }
    
}

