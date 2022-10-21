//
//  Rx+UIViewController.swift
//  
//
//  Created by moon.kwon on 2022/10/21.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    private var delegate: RxUIAdaptivePresentationDelegateProxy {
        return RxUIAdaptivePresentationDelegateProxy.proxy(for: self.base)
    }
    
    public var adaptiveWillDismiss: ControlEvent<Void> {
        return .init(events: delegate.adaptiveWillDismiss.asObserver())
    }
    
    public var adaptiveDidDismiss: ControlEvent<Void> {
        return .init(events: delegate.adaptiveDidDismiss.asObserver())
    }
    
    public var adaptiveDidAttemptToDismiss: ControlEvent<Void> {
        return .init(events: delegate.adaptiveDidAttemptToDismiss.asObserver())
    }
}
