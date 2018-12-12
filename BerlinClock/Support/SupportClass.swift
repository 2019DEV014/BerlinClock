//
//  SupportClass.swift
//  BerlinClock
//
//  Created by CGP_S on 11/12/18.
//  Copyright © 2018 CGP. All rights reserved.
//

import Foundation
import UIKit

//MARK: Check Even Odd method

func CheckEvenOdd(input : [String]) -> Int {
    if Int(input[2])! % 2 == 0 {
        return 1 //even
    } else {
        return 0 //odd
    }
}



