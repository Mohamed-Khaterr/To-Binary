//
//  Brain.swift
//  To Binary
//
//  Created by Khater on 4/14/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

struct Brain {
    var binaryArray :String = ""
    var hexArray:String = ""
    
    //mutating func calculateBinary(_ first: inout Float){
    mutating func calculateBinary(_ input: Float?){
        var first = input!
        var second:Float = 0.0
        var Arr = [Int]()

        while first > 0 {
            
            second = first / 2
            
            //if c % 1 == 0 not have float
            if second.truncatingRemainder(dividingBy: 1) == 0{
                Arr.insert(0, at: 0)
                first = second
            }else{
                Arr.insert(1, at: 0)//(1)
                first = second - (second.truncatingRemainder(dividingBy: 1))
            }
        }

        //this loop for print array
        for item in Arr{
            binaryArray += String(item)
        }
        
        binaryArray += " ₂"
    }
    
    //mutating func calculateHexa(_ first: inout Float){
    mutating func calculateHexa(_ input:  Float?){
        let hexaArray = [1:"1",2:"2",3:"3",4:"4",5:"5",6:"6",
                         7:"7",8:"8",9:"9",10:"A",11:"B",12:"C",
                         13:"D",14:"E",15:"F"]
        var first = input!
        var second:Float = 0.0
        var Arr = [Float]()
        var stringArray = [String]()

        while first > 0 {
            second = first / 16
            if second.truncatingRemainder(dividingBy: 1) != 0{
                
                Arr.append(second.truncatingRemainder(dividingBy: 1) * 16)
                first = second - (second.truncatingRemainder(dividingBy: 1))
                
            }else{
                
                Arr.append(second)
                first = second
            }
        }
        
        //This loop convert numbers (10 to 15) to latters
        for i in 0..<Arr.count{
            if hexaArray[Int(Arr[i])] != nil{
                //this insert to revers array (number1 , at: number2) byzwd b3d position number2
                stringArray.insert(hexaArray[Int(Arr[i])]!, at: 0)
            }
        }
        
        //this loop for print array
        for item in stringArray{
            hexArray += item
        }
        hexArray += " ₁₆"
    }
    
    mutating func setBinaryArray(){
        binaryArray = ""
    }
    mutating func setHexaArray(){
        hexArray = ""
    }
    
    func getBinaryArray()-> String{
        return binaryArray
    }
    mutating func getHexArray()-> String{
        return hexArray
    }
    
}
