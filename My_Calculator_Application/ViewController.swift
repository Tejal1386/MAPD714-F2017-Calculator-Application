/*
 Name: Tejal Patel
 Date: 21st September 2017
 StudentID: 300972812
 Discription: Simple Calculator Application
 Version 0.4: final calculater application
 */

import UIKit

class ViewController: UIViewController {

    //-------------------------  variables -------------------------
    var displayNumber:Double = 0
    var resultNumber:Double = 0
    var finalnumber:Double = 0
    var Temp:Double = 0
    var isDecimal:Bool = false
    var sign: String=""
    var operation: Bool = false
    var isnegative: Bool = false
    var number:String = ""
    var equalsToCounter:Int = 0
    var operationCounter:Int = 0
    
    
    
    
    //-------------------------  Outlets -------------------------
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    //-------------------------  Inherited Methods-------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // adjusting text size on display screen for big numbers
        
        displayLabel.adjustsFontSizeToFitWidth = true;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    //-------------------------  Action Methods-------------------------
    
    //number button
    ///
    /// taking numbers 0 to 9 on display screen
    ///
    /// - Parameter sender: <#sender description#>
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
    ///
    /// adding decimal point to the number
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func decimalButton(_ sender: UIButton) {
        
        Temp = Double(displayLabel.text!)!
        
        if (Temp - floor(Temp) > 0.0000000000000001) {
            isDecimal = true
        }

        
        if isDecimal == false
         {
                isDecimal = true
          
            
             if displayLabel.text == ""
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
    
    // percentage button
    ///
    /// calculate percentage for number display on screen
    ///
    /// - Parameter sender: <#sender description#>
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
    
    
    // plus or minus button
    /// 
    ///  negative and positive number
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func plus_minus_Button(_ sender: UIButton) {
      
        if displayLabel.text != "0"
        {
           Temp = Double(displayLabel.text!)!           //checking for number is negative or not
            if Temp > 0
            {
                displayLabel.text = "-" + displayLabel.text!
                isnegative = true
            }
            
           
            else
            {
                number =  displayLabel.text!
                number.remove(at: number.startIndex)
                displayLabel.text = String(number)
                isnegative = false
            }
        }
        
    }
    
    
    // arithmetic operation buttons
    /// 
    /// Doing Arithmetic operations (+ , - , * , / )
    ///
    /// Tag numbers of buttons ( = = 10, + = 11, - = 12, * = 13, ÷ = 14, AC = 17)
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func operationButton(_ sender: UIButton) {
        
        Temp = 0
      
        
        if displayLabel.text != "" {
            
            
            if sender.tag == 11 // addition
            {
                
                displayNumber = Double(displayLabel.text!)!
                sign = "+"
                
                
            }
            else if sender.tag == 12 // Subtraction
            {
                
                displayNumber = Double(displayLabel.text!)!
                sign = "-"
              
            }
            else if sender.tag == 13 // Multiplication
            {
               
                displayNumber = Double(displayLabel.text!)!
                sign = "x"
               
            }
            else if sender.tag == 14 // Division
            {
               
                displayNumber = Double(displayLabel.text!)!
                sign = "÷"
               
            }
            else if sender.tag == 17 // Clear Screen and reset all variables
            {
                resultNumber = 0
                displayNumber = 0
                finalnumber = 0
                sign = ""
                displayLabel.text = "0"
                equalsToCounter = 0
                isDecimal = false
                operation  = false
                isnegative = false
                number = ""
                operationCounter = 0;
                Temp = 0;
                
            }
           
            
        }
        
        operation = true
        isDecimal = false
        operationCounter =  operationCounter + 1;
        
    }
    
    // equals to function
    /// Represents result of arithmetic operations
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func equalsToButton(_ sender: UIButton) {
        
            
            
            if equalsToCounter == 0
            {
                finalnumber = Double(displayLabel.text!)!
            }
            else
            {
                displayNumber = Double(displayLabel.text!)!
            }
            
            
            if sign == "+"{
                resultNumber = displayNumber + finalnumber      // Addition
                
            }else if sign == "-"{
                resultNumber = displayNumber - finalnumber      // Subtraction
                
            }else if sign == "x"{
                resultNumber = displayNumber * finalnumber      // Multiplication
                
            }else if sign == "÷"{
                if finalnumber == 0
                {  displayLabel.text = "Error" }                // If number is divide by 0 then it will show error
                else{
                    resultNumber = displayNumber / finalnumber} // Division
                
            }
            displayLabel.text = String(resultNumber)
            
        isDecimal = false
        equalsToCounter = equalsToCounter + 1                   // counter used to operate serise of number calculation
        
        
    }
    
    
    
}

