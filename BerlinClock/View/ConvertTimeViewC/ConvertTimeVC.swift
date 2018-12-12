//
//  ConvertTimeVC.swift
//  BerlinClock
//
//  Created by CGP_S on 12/12/18.
//  Copyright © 2018 CGP. All rights reserved.
//

import UIKit

class ConvertTimeVC: UIViewController {
    
    var checkTime           = Timer()
    var dateFormatter       = DateFormatter()
    var row1Result : Int    = 0
    var row2Result : Int    = 0
    var row3Result : Int    = 0
    var row4Result : Int    = 0

    @IBOutlet weak var lblTime: UILabel!
    
    //MARK: viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: UIButton action methods
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRefreshClicked(_ sender: Any) {
        for index in 2...24 {
            self.view.viewWithTag(index)?.backgroundColor = UIColor.black
        }
        row1Result = 0
        row2Result = 0
        row3Result = 0
        row4Result = 0
        lblTime.text = "-:-"
    }
    
    @IBAction func btnRow1(_ sender: UIButton) {
        var count : Int = 4
        for index in 2...5 {
            if index <= sender.tag {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.red
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
                count = count - 1
            }
        }
        row1Result = count * 5
        lblTime.text = "\(row1Result + row2Result):\(row3Result + row4Result)"
    }
    
    @IBAction func btnRow2(_ sender: UIButton) {
        var count : Int = 4
        for index in 6...9 {
            if index <= sender.tag {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.red
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
                count = count - 1
            }
        }
        row2Result = count * 1
        lblTime.text = "\(row1Result + row2Result):\(row3Result + row4Result)"
    }
    
    @IBAction func btnRow3(_ sender: UIButton) {
        var count : Int = 11
        for index in 10...20 {
            if index <= sender.tag {
                self.view.viewWithTag(index)?.backgroundColor = (index % 3 == 0) ? UIColor.red : UIColor.yellow
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
                count = count - 1
            }
        }
        row3Result = count * 5
        lblTime.text = "\(row1Result + row2Result):\(row3Result + row4Result)"
    }
    
    @IBAction func btnRow4(_ sender: UIButton) {
        var count : Int = 4
        for index in 21...24 {
            if index <= sender.tag {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.yellow
            } else {
                self.view.viewWithTag(index)?.backgroundColor = UIColor.black
                count = count - 1
            }
        }
        row4Result = count * 1
        lblTime.text = "\(row1Result + row2Result):\(row3Result + row4Result)"
    }
}
