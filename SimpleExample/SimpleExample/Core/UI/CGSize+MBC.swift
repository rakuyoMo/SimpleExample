//
//  ViewController.swift
//  SimpleExample
//
//  Created by MBCore on 2019/5/29.
//  Copyright © 2019 Rakuyo. All rights reserved.
//

import UIKit

// MARK: - Extendable

extension Extendable where Base == CGSize {
    
    public var halfWidth : CGFloat {
        get { return base.width  * 0.5 }
        set { base.width  = newValue * 2 }
    }
    
    public var halfHeight: CGFloat {
        get { return base.height * 0.5 }
        set { base.height = newValue * 2 }
    }
}
