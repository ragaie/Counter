//
//  ViewController.swift
//  IncCounter
//
//  Created by Ragaie alfy on 11/15/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.




import UIKit

class ViewController: UIViewController ,CounterDelegate{
   
    
    @IBOutlet weak var counterView: Counter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counterView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func counter(_ counter: Counter, changedValue value: Int, buttonPress: String) {
        
        print(value)
        print(buttonPress)
        UIAlertView.init(title: "Alert", message: "You have value \(value)", delegate: nil, cancelButtonTitle: "Dismiss").show()
        
    }
    
  
    
    @IBAction func getCounterValue(_ sender: Any) {
        
        
        print(counterView.counterValue)
        
        
    }
    
    
}

