//
//  NSObject+MBC.swift
//  SimpleExample
//
//  Created by MBCore on 2019/5/29.
//  Copyright © 2019 Rakuyo. All rights reserved.
//

import Foundation

// MARK: - Extendable

extension Extendable where Base: NSObject {

    public static func exchange(from fromSelector: Selector, to toSelector: Selector? = nil, in _class: AnyClass, isClassMethod: Bool = false) {
        
        let _toSelector = toSelector ?? NSSelectorFromString("swizzling_" + NSStringFromSelector(fromSelector))

        guard let fromMethod = isClassMethod ? class_getClassMethod(_class, fromSelector) : class_getInstanceMethod(_class, fromSelector) else {
            return
        }
        
        guard let toMethod = isClassMethod ? class_getClassMethod(_class, _toSelector) : class_getInstanceMethod(_class, _toSelector) else {
            return
        }

        if class_addMethod(_class, fromSelector, method_getImplementation(toMethod), method_getTypeEncoding(toMethod)) {
            class_replaceMethod(_class, _toSelector, method_getImplementation(fromMethod), method_getTypeEncoding(fromMethod))
            
        } else {
            method_exchangeImplementations(fromMethod, toMethod)
        }
    }
}
