//
//  Extendable.swift
//  MBCore
//
//  Created by Rakuyo on 2019/3/2.
//  Copyright © 2019 com.mbcore. All rights reserved.
//

public struct Extendable<Base> {
    
    /// Base object to extend.
    public var base: Base
    
    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) { self.base = base }
}

/// A type that has extendable extensions.
public protocol ExtendableCompatible {
    
    /// Extended type
    associatedtype CompatibleType
    
    /// Extendable extensions.
    static var mbc: Extendable<CompatibleType>.Type { get set }
    
    /// Extendable extensions.
    var mbc: Extendable<CompatibleType> { get set }
}

extension ExtendableCompatible {
    
    /// Extendable extensions.
    public static var mbc: Extendable<Self>.Type {
        get {
            return Extendable<Self>.self
        }
        set {
            // this enables using Extendable to "mutate" base type
        }
    }
    
    /// Extendable extensions.
    public var mbc: Extendable<Self> {
        get {
            return Extendable(self)
        }
        set {
            // this enables using Extendable to "mutate" base object
        }
    }
}

// MARK: - Extend `mbc` proxy.

import class  Foundation.NSObject; extension NSObject  : ExtendableCompatible { }

import struct Swift.Dictionary;    extension Dictionary: ExtendableCompatible { }
import struct UIKit.CGSize;        extension CGSize    : ExtendableCompatible { }
