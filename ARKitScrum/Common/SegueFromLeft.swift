//
//  LeftSegue.swift
//  ARKitScrum
//
//  Created by Belinda Carrera on 11/10/17.
//  Copyright © 2017 Belinda Carrera. All rights reserved.
//

import UIKit
import QuartzCore

class SegueFromLeft: UIStoryboardSegue {
    
    override func perform() {
        let src: UIViewController = self.source
        let dst: UIViewController = self.destination
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.1
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        src.navigationController?.view.layer.add(transition, forKey: kCATransition)
        src.navigationController?.pushViewController(dst, animated: false)
    }
}
