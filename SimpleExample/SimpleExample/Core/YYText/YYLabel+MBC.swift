//
//  YYLabel+MBC.swift
//  SimpleExample
//
//  Created by MBCore on 2019/5/29.
//  Copyright © 2019 Rakuyo. All rights reserved.
//

import YYText

// MARK: - Extendable

extension Extendable where Base: YYLabel {

    @discardableResult
    public func displaysAsynchronously(_ `is`: Bool) -> Extendable {
        base.displaysAsynchronously = `is`
        return self
    }
}
