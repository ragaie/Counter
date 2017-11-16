//
//  Counter.swift
//  IncCounter
//
//  Created by Ragaie alfy on 11/15/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

@IBDesignable open class Counter: UIView {

    
        
        @IBOutlet weak var increment: UIButton!
        
        @IBOutlet weak var decrement: UIButton!

        @IBOutlet weak var valueLabel: UILabel!
        public var ID : String!
    
        public var counterValue : Int! = 0
    
        
        public var delegate : CounterDelegate!
//        private var rateImage : UIImage! //=  UIImage.init(named: "star3")
//        private var halfrateImage : UIImage! //=  UIImage.init(named: "star2")
//
//
    
    
    
    
    @IBInspectable public  var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
            
        }
    }
    
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.blue {
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var fontColor: UIColor = UIColor.black {
        didSet {
            
            valueLabel.textColor = fontColor
            
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 20.0{
        didSet {
            
            valueLabel.font = UIFont.systemFont(ofSize: fontSize)
            
        }
    }
    
    @IBInspectable public var satrtValue: Int = 0{
        didSet {
            
            valueLabel.text = String(satrtValue)
            counterValue = satrtValue
            
        }
    }
    
    @IBInspectable public var imagedec : UIImage?  = UIImage.init(named: "image-") {
        didSet {
            
           // arrowImage.image = Arrow
            
            decrement.setBackgroundImage(imagedec, for: .normal)
        }
    }
    
    
    @IBInspectable public var imagein : UIImage?  = UIImage.init(named: "image+") {
        didSet {
            increment.setBackgroundImage(imagein, for: .normal)

            // arrowImage.image = Arrow
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
            
            
            let nib = UINib(nibName: "Counter", bundle: bundle)
            
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            
            // to make view fit view in design you welcome.
            view.frame = self.bounds
            
            view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            // nib.contentView.frame = bounds
            
            addSubview(view)
            
            // custom initialization logic
            
            // initalize images
            
            
//            rateImage =    UIImage(named: "star3", in: bundle,compatibleWith: nil)!
//            halfrateImage =    UIImage(named: "star2", in: bundle,compatibleWith: nil)!
//
//            unrateImage =    UIImage(named: "star1", in: bundle,compatibleWith: nil)!
//
            
            
        }
        
        func initActionAndDelegete()  {
            
            
            increment.addTarget(self, action: #selector(Counter.increseValue(_:)), for: .touchUpInside)
            decrement.addTarget(self, action: #selector(Counter.decreschangeValue(_:)), for: .touchUpInside)


            
        }
    
    
    
    @objc func increseValue(_ sender : UIButton){
        
        
        counterValue = counterValue + 1
        valueLabel.text = String(counterValue)

        if delegate != nil {
            
            delegate.counter(self, changedValue: counterValue)
        }
        
        
        
    }
    
  @objc func decreschangeValue(_ sender : UIButton){
        
        
        if counterValue > satrtValue {
        

            counterValue = counterValue - 1
            valueLabel.text = String(counterValue)

        }
        if delegate != nil {
        
            delegate.counter(self, changedValue: counterValue)
        }

    }
}
