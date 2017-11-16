//
//  ViewController.swift
//  RatingBar-Chtar
//
//  Created by Ragaie alfy on 7/18/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,RatingBarDelegate {

    
    @IBOutlet weak var ratingbar: RatingBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      // ratingbar.setRatingValue(rateValue: 3.2)
        ratingbar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func RatingBar(_ ratingBar: RatingBar, didChangeValue value: Int) {
    
        
        print(value)
    }
    
    
    @IBAction func printRateBarValue(_ sender: Any) {
        
        print(ratingbar.rateValue)
    }
    
    
    
}

