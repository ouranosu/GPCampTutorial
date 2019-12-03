//
//  CampAriaPageController.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/26.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit

class CampAriaPageController: UIPageViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    let idList = ["Camp1","Camp2","Camp3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller = storyboard!.instantiateViewController(withIdentifier: idList.first!)
        self.setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        self.dataSource = self

    }
    
    //右ドラッグ時メソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = idList.firstIndex(of: viewController.restorationIdentifier!)!
        if index > 0 {
            return storyboard!.instantiateViewController(withIdentifier: idList[index - 1])
        }
        return nil
    }
    
    //左ドラッグ時メソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = idList.firstIndex(of: viewController.restorationIdentifier!)!
        if index < idList.count - 1 {
            return storyboard?.instantiateViewController(withIdentifier: idList[index + 1])
        }
        return nil
    }
    
    

}
