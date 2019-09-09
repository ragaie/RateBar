//
//  RatingBar.swift

//
//  Created by Ragaie alfy on 7/10/17.Egypt ()+201113938736)
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

@IBDesignable open class RatingBar: UIView {
    
    @IBOutlet weak var rate1: UIButton!
    @IBOutlet weak var rate2: UIButton!
    @IBOutlet weak var rate3: UIButton!
    
    @IBOutlet weak var rate4: UIButton!
    
    @IBOutlet weak var rate5: UIButton!
    public var ID : String!
    
    public var delegate : RatingBarDelegate!
    public var rateValue : Int! = 0
    private var allRatingButton : [UIButton]! = []
    @IBInspectable public var rateImage: UIImage?{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var halfrateImage: UIImage?{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var unrateImage: UIImage?{
        didSet {
            setRatingValue(rateValue: 0)
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var ratingValue: Double = 0{
        didSet {
            setRatingValue(rateValue: ratingValue)
        }
    }
    
    //MARK: Initializers
    override public init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
    }
    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "RatingBar", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        allRatingButton = [rate1,rate2,rate3,rate4,rate5]
        addSubview(view)
        // initalize images
        rateImage =    UIImage(named: "star3", in: bundle,compatibleWith: nil)!
        halfrateImage =    UIImage(named: "star2", in: bundle,compatibleWith: nil)!
        // if unrateImage != nil {
        unrateImage =    UIImage(named: "star1", in: bundle,compatibleWith: nil)!
        // }
    }
    
    func initActionAndDelegete()  {
        rate1.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate2.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate3.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate4.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate5.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        
    }
    
    open func setRatingValue(rateValue : Double){
        //rate value from 1 to 5
        if rateValue == 0 {
            for item in allRatingButton{
                item.isUserInteractionEnabled = true
            }
            //break you dont need to set item with zero rating value
            // return
        }
        else{
            for item in allRatingButton{
                
                item.isUserInteractionEnabled = false
            }
        }
        //print(rateValue)
        if rateValue  <= 0 {
            for item in allRatingButton {
                item.setBackgroundImage(unrateImage, for: .normal)
            }
        }
        else {
            
            var rate = rateValue
            self.rateValue = Int(rate)
            if rate > 5 {
                rate = rate.truncatingRemainder(dividingBy: 5)
            }
            if rate <= 5 {
                var stringNumber = String(rate).split(separator: ".")
                let firstNumber : Int! = Int(stringNumber[0])
                let secandNumber : Int! = Int(stringNumber[1])
                if firstNumber >= 1 {
                    for  i  in  0...firstNumber - 1{
                        
                        allRatingButton[i].setBackgroundImage(rateImage, for: .normal)
                    }
                }
                if secandNumber > 0 {
                    allRatingButton[firstNumber].setBackgroundImage(halfrateImage, for: .normal)
                    
                }
            }
        }
    }
    
    @objc open func changeRating(_ sender : UIButton){
        // if sender.tag == 0 {
        switch sender.restorationIdentifier! {
            
        case "rate1":
            if sender.tag == 0 {
                sender.setBackgroundImage(rateImage, for: .normal)
                sender.tag = 1
                callDelegate(value: 1)
            }
            else{
                if allRatingButton[1].tag == 0 {
                    for item in allRatingButton{
                        item.setBackgroundImage(unrateImage, for: .normal)
                        item.tag = 0
                    }
                    callDelegate(value: 0)
                }
                else{
                    for i in 1...4{
                        allRatingButton[i].setBackgroundImage(unrateImage, for: .normal)
                        allRatingButton[i].tag = 0
                    }
                    callDelegate(value: 1)
                    
                }
                
            }
            break
            
        case "rate2":
            if sender.tag == 0 {
                for i in 0...1{
                    allRatingButton[i].setBackgroundImage(rateImage, for: .normal)
                    allRatingButton[i].tag = 1
                }
                callDelegate(value: 2)
            }
            else{
                if allRatingButton[2].tag == 0 {
                    for i in 1...4{
                        allRatingButton[i].setBackgroundImage(unrateImage, for: .normal)
                        allRatingButton[i].tag = 0
                    }
                    callDelegate(value: 1)
                }
                else{
                    for i in 2...4{
                        allRatingButton[i].setBackgroundImage(unrateImage, for: .normal)
                        allRatingButton[i].tag = 0
                    }
                    callDelegate(value: 2)
                }
            }
            break
            
            
        case "rate3":
            if sender.tag == 0 {
                for i in 0...2{
                    allRatingButton[i].setBackgroundImage(rateImage, for: .normal)
                    allRatingButton[i].tag = 1
                }
                callDelegate(value: 3)
            }
            else{
                if allRatingButton[3].tag == 0 {
                    for i in 2...4{
                        allRatingButton[i].setBackgroundImage(unrateImage, for: .normal)
                        allRatingButton[i].tag = 0
                    }
                    callDelegate(value: 2)
                }
                else{
                    for i in 3...4{
                        allRatingButton[i].setBackgroundImage(unrateImage, for: .normal)
                        allRatingButton[i].tag = 0
                    }
                    callDelegate(value: 3)
                }
            }
            break
            
        case "rate4":
            if sender.tag == 0 {
                for i in 0...3{
                    
                    allRatingButton[i].setBackgroundImage(rateImage, for: .normal)
                    allRatingButton[i].tag = 1
                }
                callDelegate(value: 4)
            }
            else{
                if allRatingButton[4].tag == 0 {
                    for i in 3...4{
                        allRatingButton[i].setBackgroundImage(unrateImage, for: .normal)
                        allRatingButton[i].tag = 0
                    }
                    callDelegate(value: 3)
                    
                }
                else{
                    allRatingButton[4].setBackgroundImage(unrateImage, for: .normal)
                    allRatingButton[4].tag = 0
                    callDelegate(value: 4)
                    
                }
                
                
            }
            break
        case "rate5":
            if sender.tag == 0 {
                for i in 0...4{
                    allRatingButton[i].setBackgroundImage(rateImage, for: .normal)
                    allRatingButton[i].tag = 1
                }
                callDelegate(value: 5)
            }
            else{
                allRatingButton[4].setBackgroundImage(unrateImage, for: .normal)
                allRatingButton[4].tag = 0
                
                callDelegate(value: 4)
            }
            break
        default:
            
            break
        }
        
        
    }
    
    func callDelegate(value : Int){
        if delegate != nil {
            delegate.RatingBar(self, didChangeValue: value)
            rateValue = value
            
        }
    }
    
    
}
