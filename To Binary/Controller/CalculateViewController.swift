//
//  ViewController.swift
//  To Binary
//
//  Created by Khater on 4/5/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit
import AVFoundation

class CalculateViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var userInputSender: Float?
    //var userInput2: Float? old version
    var brain = Brain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //To make button rounded corners
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height/2
        
        //This to add Done button
        numberTextField.addDoneButtonOnKeyboard()
        
        welcomeLabel.text = "Welcome To Binary :)"
        errorLabel.textColor = .black
        errorLabel.text = ""
    }
    
    //This func To Disappear the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //welcomeTextView.resignFirstResponder()
        numberTextField.resignFirstResponder()
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        errorLabel.text = ""
        numberTextField.placeholder = "Decimal Number"
        errorLabel.clearColorTime()

        //userInput = Float(numberTextField.text!) old version
        //userInput2 = userInput

        if let userInput = Float(numberTextField.text!){
        //if userInput != nil {
            //brain.calculateBinary(&userInput!) old version
            //brain.calculateHexa(&userInput2!)
            brain.calculateBinary(userInput)
            brain.calculateHexa(userInput)
            
            userInputSender = userInput
            
            
            //go to result page function
            self.performSegue(withIdentifier: "goToResult",sender: self)
            
        }else{
            errorLabel.text = "Error!"
            errorLabel.changeColor()
            sender.wiggleTheButton()
            numberTextField.text = ""
            numberTextField.placeholder = "Please Enter Number"
        }
        
        //to reset result page
        brain.setBinaryArray()
        brain.setHexaArray()

    }
    
    //When user stope add input the TextField will empty
    func textFieldDidEndEditing(_ textField: UITextField) {
        //numberTextField.text = ""
    }
    
    //send values to result page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            if userInputSender != nil{
                //value sended
                destinationVC.number = String(numberTextField.text!)
                destinationVC.binary = brain.getBinaryArray()
                destinationVC.hexadecimal = brain.getHexArray()
            }else{
                destinationVC.number = "Error!"
                destinationVC.binary = "Error!"
                destinationVC.hexadecimal = "Error!"
            }
        }
    }
}

