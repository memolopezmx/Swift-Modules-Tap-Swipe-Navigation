//
//  ViewController.swift
//  TapSwipeNavigation
//
//  Created by ginppian on 02/05/17.
//  Copyright © 2017 Nut Systems. All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()

    override func viewDidLoad() {
        super.viewDidLoad()

        let items = ["UnoViewController", "DosViewController", "TresViewController"]
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
        self.style()
    }
    
    func style() {
        let color: UIColor = UIColor(red: 121.0 / 255, green: 148.0 / 255, blue: 180.0 / 255, alpha: 1)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setTabExtraWidth(8)
        
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3, forSegmentAt: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3, forSegmentAt: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3 + 5, forSegmentAt: 2)
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.black.withAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFont(ofSize: 14))
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        var vc = UIViewController()
        
        switch index {
        case 0:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

