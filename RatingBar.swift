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
     var delegate : RatingBarDelegate!
    public var rateValue : Int! = 0
    private var allRatingButton : [UIButton]! = []
    private var tags : [Int] = [0,0,0,0,0]
    @IBInspectable public var rateImage: UIImage? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var halfrateImage: UIImage? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var unrateImage: UIImage? {
        didSet {
            setRatingValue(rateValue: 0)
            self.setNeedsDisplay()
        }
    }
    @IBInspectable public var ratingValue: Double = 0 {
        didSet {
            setRatingValue(rateValue: ratingValue)
        }
    }
    // MARK: Initializers
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
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        // to make view fit view in design you welcome.
        view?.frame = self.bounds
        view?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        allRatingButton = [rate1,rate2,rate3,rate4,rate5]
        addSubview(view ?? UIView())
        // initalize images
//        rateImage =    UIImage(named: "star3", in: bundle,compatibleWith: nil)!
//        halfrateImage =    UIImage(named: "star2", in: bundle,compatibleWith: nil)!
//        // if unrateImage != nil {
//        unrateImage =    UIImage(named: "star1", in: bundle,compatibleWith: nil)!
        // }
    }
    func initActionAndDelegete() {
        rate1.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate2.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate3.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate4.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
        rate5.addTarget(self, action: #selector(RatingBar.changeRating(_:)), for: .touchUpInside)
    }
    open func setRatingValue(rateValue : Double) {
        // rate value from 1 to 5
        if rateValue == 0 {
            for item in allRatingButton{
                item.isUserInteractionEnabled = true
            }
            // break you dont need to set item with zero rating value
            // return
        } else {
            for item in allRatingButton {
                item.isUserInteractionEnabled = false
            }
        }
        //print(rateValue)
        if rateValue  <= 0 {
            for item in allRatingButton {
                item.setBackgroundImage(unrateImage, for: .normal)
            }
        } else {
            var rate = rateValue
            self.rateValue = Int(rate)
            if rate > 5 {
                rate = rate.truncatingRemainder(dividingBy: 5)
            }
            if rate <= 5 {
                let stringNumber = String(rate).split(separator: ".")
                let firstNumber : Int! = Int(stringNumber[0])
                let secandNumber : Int! = Int(stringNumber[1])
                if firstNumber >= 1 {
                    for  iii  in  0...firstNumber - 1 {
                        allRatingButton[iii].setBackgroundImage(rateImage, for: .normal)
                    }
                }
                if secandNumber > 0 {
                    allRatingButton[firstNumber].setBackgroundImage(halfrateImage, for: .normal)
                }
            }
        }
    }
    @objc  func changeRating(_ sender : UIButton) {
  // remove all rating button
            for item in allRatingButton {
                item.setBackgroundImage(unrateImage, for: .normal)
                item.tag = 0
            }
        let currentNumber = Int(sender.restorationIdentifier ?? "") ?? 0
        var numberToSelect = 0
        numberToSelect = tags[currentNumber - 1] == 0 ? currentNumber : currentNumber - 1
        for iii in 0..<numberToSelect {
                allRatingButton[iii].setBackgroundImage(rateImage, for: .normal)
                tags[iii] = 1
            }
        for jjj in numberToSelect..<5 {
            tags[jjj] = 0
        }
            callDelegate(value: numberToSelect)
    }
    func callDelegate(value : Int) {
        if delegate != nil {
            delegate.ratingBar(ratingBar: self, didChangeValue: value)
            rateValue = value
        }
    }
}
