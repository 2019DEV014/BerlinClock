//
//  HomeVC.swift
//  BerlinClock
//
//  Created by CGP_S on 11/12/18.
//  Copyright © 2018 CGP. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var checkTime       = Timer()
    var dateFormatter   = DateFormatter()
    
    @IBOutlet weak var lblDigitalTime: UILabel!
    
    //MARK: viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        checkTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        //Capture current date of device in 24 hours format
        dateFormatter.dateFormat = "HH:mm:ss"
        let date24 = dateFormatter.string(from: Date())
        
        lblDigitalTime.text = date24
        
        let arrSplitTime = date24.components(separatedBy: ":")
        let result = CheckEvenOdd(input: arrSplitTime)
        
        if result == 1 {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.view.viewWithTag(1)?.backgroundColor = UIColor.red
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.view.viewWithTag(1)?.backgroundColor = UIColor.black
            }, completion: nil)
        }
        
        illustrateColorForHour(input: arrSplitTime)
        illustrateColorForMinutes(input: arrSplitTime)
    }
    
    //MARK: UIButton action methods
    @IBAction func btnConvertTimeClicked(_ sender: Any) {
        self.navigationController?.pushViewController(ConvertTimeVC(), animated: true)
    }
    
    func illustrateColorForHour(input : [String]) {
        let resultHour = Int(input[0])! / 5
        for index in 2...5 {
            if index <= resultHour + 1 {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.red
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
            }
        }
        
        let resultHoursMod = Int(input[0])! % 5
        for index in 6...9 {
            if index <= resultHoursMod + 5 {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.red
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
                
            }
        }
    }
    
    func illustrateColorForMinutes(input : [String]) {
        let resultMinutes = Int(input[1])! / 5
        for index in 10...20 {
            if index <= resultMinutes + 9 {
                self.view.viewWithTag(index)?.backgroundColor = (index % 3 == 0) ? UIColor.red : UIColor.yellow
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
            }
        }
        
        let resultMinutesMod = Int(input[1])! % 5
        for index in 21...24 {
            if index <= resultMinutesMod + 20 {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.yellow
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
                
            }
        }
    }
}
