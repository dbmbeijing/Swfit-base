//
//  ViewController.swift
//  绘制线条
//
//  Created by xdf on 2018/5/30.
//  Copyright © 2018年 xdf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var socreTextFeild: UITextField!
    
    var testView: SocreMarkView!
    
    
    
    

    @IBAction func sureButtonClick(_ sender: UIButton) {
        
        let score = Double.init(socreTextFeild.text!)
        
        if let score = score {
            
            self.testView.sorce = score
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  xuView = SocreMarkView(frame: CGRect(x: 100, y: 100, width: 250, height: 100))
        
        self.testView = xuView
        xuView.sorce = 0.6
        
        self.view.addSubview(xuView)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


