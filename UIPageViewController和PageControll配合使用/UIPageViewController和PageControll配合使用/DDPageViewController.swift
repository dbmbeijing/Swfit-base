//
//  DDPageViewController.swift
//  UIPageViewController和PageControll配合使用
//
//  Created by xdf on 2018/5/29.
//  Copyright © 2018年 xdf. All rights reserved.
//

import UIKit



protocol PageViewControllerDelegater: class{
    
    func pageViewController(pageViewController: DDPageViewController,didUpdateIndex index: Int)
    
    // 当前索引值发生改变时调用
    func pageViewController(pageViewController: DDPageViewController,didUpdatePageIndex index: Int)
    
    
    
}






class DDPageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    
    
    var pageViewDelegate: PageViewControllerDelegater!

    
    lazy var childenVc:[UIViewController] = {
        
        
        return [
        
            self.getChildrenVc(indetify: "firstVc"),
            self.getChildrenVc(indetify: "secondVc"),
            self.getChildrenVc(indetify: "thirdVc")
        
        ]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        // 设置首页
        if  let fistVc = childenVc.first{
            
            setViewControllers([fistVc], direction: .forward, animated: true, completion: nil)
        
        }
        
        pageViewDelegate.pageViewController(pageViewController: self, didUpdateIndex: childenVc.count)
        
    }

    
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = childenVc.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        let orderAllVcCount = childenVc.count
        
        guard previousIndex >= 0  else {
            
            return childenVc.last
        }
        
        guard orderAllVcCount > previousIndex else {
            return nil
        }
        
        return childenVc[previousIndex]
    }
    
    // 取出后一个控制器的界面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        
        guard let viewControllerIndex = childenVc.index(of: viewController) else {
            
            return nil
        }
        
        
        let nextIndex = viewControllerIndex + 1
        
        let allCountVc = childenVc.count
        guard allCountVc > nextIndex else {
            
            return nil
        }
        
        guard allCountVc != nextIndex  else {
           return childenVc.first
        }
        
        return childenVc[nextIndex]
    }

    // 切换完毕后的回调
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let fistViewVc = viewControllers?.first,let index = childenVc.index(of: fistViewVc) {
            
            pageViewDelegate.pageViewController(pageViewController: self, didUpdatePageIndex: index)
            
        }
        
        
        
    }
    
    
    
    
    
    
   
    func getChildrenVc(indetify: String) -> UIViewController {
        
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:indetify)
        
    }

}
