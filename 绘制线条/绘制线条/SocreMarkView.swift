//
//  SocreMarkView.swift
//  绘制线条
//
//  Created by xdf on 2018/5/30.
//  Copyright © 2018年 xdf. All rights reserved.
//

/*
 
 仪表盘 分数绘制 时钟绘制 都可以使用  
 
 
 */

import UIKit

class SocreMarkView: UIView {
   
    // 范围是0 - 1
    var  sorce: Double = 0 {
        
        didSet(newValue) {
            
            print(newValue)
            guard newValue < 1 else {
                
                print("设置的分数应该小于1")
                return
            }
        
            guard newValue >= 0 else {
                
                print("设置的分数应该大于 0")
                return
            }
            
            self.setNeedsDisplay()
            
            
        }
        
    }
    
    var norColor: UIColor?
    
    var hightColor:UIColor?
    
    
    
    override init(frame: CGRect) {
        
        // 默认
        norColor = UIColor.gray
        
        hightColor = UIColor.blue
        
        
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    
    
    
    override func draw(_ rect: CGRect) {
        
        
        let  min = rect.size.width > rect.size.height ? rect.size.height : rect.size.width
        
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setLineWidth(2)
        
        context.setLineCap(.round)
        
        context.setAllowsAntialiasing(true)
        
        let centerX = Double(rect.origin.x + rect.size.width / 2.0)
        
        let centerY = Double(rect.origin.y + rect.size.height / 2.0)
        
        let raiusEnd = Double(min / 2 - 7)
        // 段分割线 长度
        let radiusShorStrat = Double(raiusEnd - 3 )
        
        // 长分割线 长度
        let radiusLongStra = Double(raiusEnd - 5)
        
        var  heightCount = Int((1 - sorce) * 60)
        
        if heightCount == 0 {
            
            heightCount = -1
            
        }else if (heightCount == 59){
            
            heightCount = 58
            
        }
        
        context.beginPath()

        context.setStrokeColor(norColor!.cgColor)
        
        for i  in 0...60 {
            
            if i > heightCount{
                
                
                context.strokePath()
                
                context.setStrokeColor(hightColor!.cgColor)
                
            }
            
            
            var radiusStart = Double(i % 5)
            
            if radiusStart == 0 {
                
                radiusStart = radiusLongStra
                
            }else{
                
                radiusStart = radiusShorStrat
                
            }
            
            
            let degree = Double( i * 6) / 180.0  * Double.pi
            
            let startX = centerX + radiusStart * sin(degree)
            
            let stratY  = centerY + radiusStart * cos(degree)
            
            let endX = centerX + raiusEnd * sin(degree)
            
            let endY = centerY + raiusEnd * cos(degree)
            
            context.move(to: CGPoint(x: startX, y: stratY))
            
            context.addLine(to: CGPoint(x: endX, y: endY))
            
            
        }
        
        context.strokePath()
       
        
    }
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    

}
