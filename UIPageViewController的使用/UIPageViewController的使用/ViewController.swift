//
//  ViewController.swift
//  UIPageViewController的使用
//
//  Created by xdf on 2018/5/29.
//  Copyright © 2018年 xdf. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    

    
    // 盛装自控制器的数组
    
   lazy var allViewContollers:[UIViewController] = {

    return [
        
        self.getViewController(indentifier: "oneVc"),
        self.getViewController(indentifier: "twoVc"),
        self.getViewController(indentifier: "threeVc")
    ]
    
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let fistViewController = allViewContollers.first {
            
            
            setViewControllers([fistViewController], direction: .forward, animated: true, completion: nil)
            
        }
        
    }

    // 获取前一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard let viewControllerIndex = allViewContollers.index(of: viewController) else {
            
            return nil
        
        }
        
        let previounsx =  viewControllerIndex - 1
        
        guard previounsx >= 0 else {
            
            return allViewContollers.last
            
        }
        
        guard allViewContollers.count > previounsx else {
            
            return nil
        }
        
        return allViewContollers[previounsx]
        
    }
    
    
    // 获取后一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = allViewContollers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllerCount = allViewContollers.count
        
        guard orderedViewControllerCount !=  nextIndex else {
            
            
            return  allViewContollers.first
        }
        
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        
        return allViewContollers[nextIndex]
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // 从故事板获取控制器的方法
    
    func getViewController(indentifier: String) -> UIViewController {
        
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:indentifier)
        
        
    }

}

