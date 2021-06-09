//
//  UIButtonExtantion.swift
//  To Binary
//
//  Created by Khater on 4/18/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit
import AVFoundation

//This File For animations

var timeObj = Timer()

//This for Labels
extension UILabel{
    //this func make label wiggle
    func wiggleTheLabel() {
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        wiggleAnim.duration = 0.05
        wiggleAnim.repeatCount = 5
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        wiggleAnim.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(wiggleAnim, forKey: "position")
        
    }
    //this func change color every 0.3sec
    func changeColor(){
        var i = 0
        timeObj = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
        timer in
            if i == 0 {
                self.textColor = .red
                i += 1
            }else{
                self.textColor = .black
                i = 0
            }
        }
    }
    func clearColorTime(){
        timeObj.invalidate()
    }
}
//This for Buttons
extension UIButton{
    //this func make button wiggle
    func wiggleTheButton() {
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        wiggleAnim.duration = 0.05
        wiggleAnim.repeatCount = 5
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        wiggleAnim.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(wiggleAnim, forKey: "position")
    }
    
    func dimTheButton(){
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 0.75
        }) { (finished) in
            UIView.animate(withDuration: 0.15, animations: {
                self.alpha = 1.0
            })
        }
    }
}

//This extension to add done button to Keyboard(numberPad)
extension UITextField {

   func addDoneButtonOnKeyboard() {
       let keyboardToolbar = UIToolbar()
       keyboardToolbar.sizeToFit()
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
           target: nil, action: nil)
       let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
           target: self, action: #selector(resignFirstResponder))
       keyboardToolbar.items = [flexibleSpace, doneButton]
       self.inputAccessoryView = keyboardToolbar
   }
}
