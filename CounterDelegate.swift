//
//  CounterDelegete.swift
//  IncCounter
//
//  Created by Ragaie alfy on 11/15/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import Foundation

public protocol CounterDelegate {
    
    
    
    func counter(_ counter: Counter, changedValue value : Int,buttonPress : String)

}
