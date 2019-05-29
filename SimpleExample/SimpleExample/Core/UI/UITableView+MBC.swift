//
//  UITableView+MBC.swift
//  SimpleExample
//
//  Created by MBCore on 2019/5/29.
//  Copyright © 2019 Rakuyo. All rights reserved.
//

import UIKit

// MARK: - Extendable

import RxSwift
import RxCocoa

// MARK: - Private

extension UITableView {
    
    fileprivate var _hideKeyboardGesture: UITapGestureRecognizer {
        if let ges = objc_getAssociatedObject(self, &kHideKeyboardGestureKey) as? UITapGestureRecognizer {
            return ges
        }
        
        let ges = UITapGestureRecognizer()
        
        ges.numberOfTapsRequired = 1
        ges.cancelsTouchesInView = false
        
        ges.rx.event.bind { _ in
            
            UIApplication.shared.keyWindow!.endEditing(true)
            
            }.disposed(by: _tapGestureDisposeBag)
        
        objc_setAssociatedObject(self, &kHideKeyboardGestureKey, ges, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        return ges
    }
    
    fileprivate var _tapGestureDisposeBag: DisposeBag {
        if let disposeBag = objc_getAssociatedObject(self, &kTapGestureDisposeBagKey) as? DisposeBag {
            return disposeBag
        }
        
        let disposeBag = DisposeBag()
        
        objc_setAssociatedObject(self, &kTapGestureDisposeBagKey, disposeBag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        return disposeBag
    }
}

// MARK: - Private Key

private var kIsHideKeyboardWhenTapKey = "kIsHideKeyboardWhenTapKey"
private var kHideKeyboardGestureKey   = "kHideKeyboardGestureKey"
private var kTapGestureDisposeBagKey  = "kTapGestureDisposeBagKey"
