//
//  ResultViewController.swift
//  To Binary
//
//  Created by Khater on 4/14/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var binaryLabel: UILabel!
    @IBOutlet weak var binaryAnswerLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var hexaAnswerLabel: UILabel!
    @IBOutlet weak var hexaLabel: UILabel!
    
    var number: String?
    var binary: String?
    var hexadecimal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //To make button rounded corners
        backButton.layer.cornerRadius = backButton.frame.size.height/2
        
        numberLabel.text = "\(number ?? "") ₁₀"
        binaryAnswerLabel.text = binary
        hexaAnswerLabel.text = hexadecimal
    }

    @IBAction func backPressed(_ sender: UIButton) {
        
        //go back to ViewController function
        self.dismiss(animated: true, completion: nil)
    }
}
