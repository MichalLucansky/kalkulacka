//
//  ViewController.swift
//  calculator
//
//  Created by Michal Lučanský on 14.10.16.
//  Copyright © 2016 Michal Lučanský. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var actualOperator : String = ""
    var userMidleOfTiping: Bool = false
    var firstValue: String = ""
    var secondValue: String = ""
    
    @IBOutlet weak var displey: UILabel!
    @IBAction func numberButton(_ sender: UIButton) {
        updateDispley(number: String(sender.tag))
    }
    func updateDispley(number: String)
    {
        if userMidleOfTiping == false
        {
            if let num = displey.text
            {
                if num != ""
                {
                    firstValue = num
                }
            }
            userMidleOfTiping = true
            displey.text = number
        }
        else if userMidleOfTiping == true
        {
            displey.text = displey.text! + number
            firstValue = displey.text!
        }
        
    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        userMidleOfTiping = false
        
        
        if let num = displey.text
        {
            if displey.text != ""
            {
                firstValue = num
                
            }
        }
        
        buttonSelected(tag: sender.tag)
        switch sender.tag {
        case 11 : actualOperator = "+"
        case 12 : actualOperator = "-"
        case 13 : actualOperator = "*"
        case 14 : actualOperator = "/"
        default : return
        }
    }
    
    @IBAction func equals(_ sender: UIButton) {
        
        calculate()
    }
    func calculate(){
        if firstValue.isEmpty{
            return
        }
        var result: String = ""
        switch actualOperator{
        case "+" : result = "\((Double(firstValue))! + (Double(displey.text!)!))"
        case "-" : result = "\((Double(firstValue))! - (Double(displey.text!)!))"
        case "/" : result = "\((Double(firstValue))! / (Double(displey.text!)!))"
        case "*" : result = "\((Double(firstValue))! * (Double(displey.text!)!))"
        default : return
        }
        userMidleOfTiping = false
        displey.text = result
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mathOperations(_ operation: (String, String)->String){
        displey.text = operation(firstValue, secondValue)
        
        
    }
    
    
    func buttonSelected(tag: Int){
        for i in 11..<15{
            if let button = self.view.viewWithTag(i) as? UIButton{
                button.backgroundColor = UIColor.clear
            }
            if let button = self.view.viewWithTag(tag) as? UIButton{
                button.backgroundColor = UIColor.yellow
            }
        }
    }
    
}


