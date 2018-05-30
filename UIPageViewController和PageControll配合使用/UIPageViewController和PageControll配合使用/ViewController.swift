//
//  ViewController.swift
//  UIPageViewController和PageControll配合使用
//
//  Created by xdf on 2018/5/29.
//  Copyright © 2018年 xdf. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PageViewControllerDelegater {
    
    @IBOutlet weak var pageControll: UIPageControl!
    // 总数量改变时调用
    func pageViewController(pageViewController: DDPageViewController, didUpdateIndex index: Int) {
        
        self.pageControll.numberOfPages = index
    }
    // 滚动结束之后调用
    
    func pageViewController(pageViewController: DDPageViewController, didUpdatePageIndex index: Int) {
        
        self.pageControll.currentPage = index
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let pageViewVc = segue.destination as?DDPageViewController {
            
            pageViewVc.pageViewDelegate = self
            
        
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

