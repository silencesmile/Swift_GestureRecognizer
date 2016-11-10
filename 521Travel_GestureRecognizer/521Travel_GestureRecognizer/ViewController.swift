//
//  ViewController.swift
//  521Travel_GestureRecognizer
//
//  Created by youngstar on 16/10/31.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rect:UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        // UISwipeGestureRecognizer：滑动（快速移动）
//        setSwipe()
        
        // UITapGestureRecognizer：轻点手势（点击）
//        setTap()
        
        // UIPinchGestureRecognizer：捏合手势（两个手指进行放大缩小）
//        setPinch()
        
        // UIRotationGestureRecognizer：旋转手势（两个手指进行旋转）
//        setRotation()
        
        // UIPanGestureRecognizer：拖动手势
//        setPan()
        // UILongPressGestureRecognizer：长按
        setLongPress()
    }
    
    // UISwipeGestureRecognizer：滑动（快速移动）
    func setSwipe()  {
        let swipe = UISwipeGestureRecognizer.init(target: self, action: #selector(swipAction))
        
        // 定义滑动的方向，默认是向右， 如果是多个方向就需要定义多个
        swipe.direction = UISwipeGestureRecognizerDirection.up
        self.view .addGestureRecognizer(swipe)
        
    }
    
    
    
    func swipAction(recognizer:UISwipeGestureRecognizer)  {
        print("swipe OK")

        // 滑动的起点
        let point = recognizer.location(in: self.view)
        print(point.x)
        print(point.y)
    }
    
    
     // UITapGestureRecognizer：轻点手势（点击）
    func setTap()  {
        let tapSingle = UITapGestureRecognizer.init(target: self, action: #selector(tapSingleDid))
        tapSingle.numberOfTapsRequired = 1  // 点击的次数
        tapSingle.numberOfTouchesRequired = 1 // 手指数量
        
        let tapDouble = UITapGestureRecognizer.init(target: self, action: #selector(tapDoubleDid))
        tapDouble.numberOfTapsRequired = 2
        tapDouble.numberOfTouchesRequired = 1
        
        self.view .addGestureRecognizer(tapSingle)
        self.view .addGestureRecognizer(tapDouble)
    }
    
    func tapSingleDid()  {
        print("单击了")
    }
    
    func tapDoubleDid()  {
        print("双击了")
    }
    
    
    // UIPinchGestureRecognizer：捏合手势（两个手指进行放大缩小）
    func setPinch()  {
        let pinch = UIPinchGestureRecognizer.init(target: self, action: #selector(pinchAction))
        self.view .addGestureRecognizer(pinch)
        
    }

    func pinchAction(recognzer:UIPinchGestureRecognizer)  {
        // //在监听方法中可以实时获得捏合的比例
        print(recognzer.scale)
    }
    
    // UIRotationGestureRecognizer：旋转手势（两个手指进行旋转）
    func setRotation()  {
        let rotation = UIRotationGestureRecognizer.init(target: self, action: #selector(rotationAction))
        self.view .addGestureRecognizer(rotation)
    }
    
    func rotationAction(recognizer:UIRotationGestureRecognizer ) {
        // 输出旋转的角度
        print(recognizer.rotation*(180/CGFloat(M_PI)))
    }
    
    
       // UIPanGestureRecognizer：拖动手势
    func setPan()  {
        
        rect = UIView()
        rect.frame = CGRect(x:0, y:0, width:100, height:100)
        rect.center = self.view.center
        rect.backgroundColor = UIColor.red
        self.view .addSubview(rect)

        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panAction))
        pan.maximumNumberOfTouches = 1
        rect .addGestureRecognizer(pan)
    }
    
    func panAction(recognizer:UIPinchGestureRecognizer) {
     
        let point=recognizer.location(in: self.view)
        //设置矩形的位置
        rect.center=point
    }
    
    // UILongPressGestureRecognizer：长按
    func setLongPress()  {
        
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressAction))
        self.view .addGestureRecognizer(longPress)
        
        
    }
    
    func longPressAction(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            print("长按响应开始")
        }
        else
        {
            print("长按响应结束")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

