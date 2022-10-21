//
//  RxAdaptivePresentation.swift
//  
//
//  Created by moon.kwon on 2022/10/20.
//

import RxSwift
import RxCocoa
import UIKit

final class RxUIAdaptivePresentationDelegateProxy: DelegateProxy<UIViewController, UIAdaptivePresentationControllerDelegate> {
    let adaptiveWillDismiss: PublishSubject<Void> = .init()
    let adaptiveDidDismiss: PublishSubject<Void> = .init()
    let adaptiveDidAttemptToDismiss: PublishSubject<Void> = .init()
    
    init(viewController: UIViewController) {
        super.init(parentObject: viewController, delegateProxy: RxUIAdaptivePresentationDelegateProxy.self)
    }
    
    static func registerKnownImplementations() {
        self.register { RxUIAdaptivePresentationDelegateProxy(viewController: $0) }
    }
    
    static func currentDelegate(for object: UIViewController) -> UIAdaptivePresentationControllerDelegate? {
        return object.navigationController?.presentationController?.delegate
    }
    
    static func setCurrentDelegate(_ delegate: UIAdaptivePresentationControllerDelegate?, to object: UIViewController) {
        object.navigationController?.presentationController?.delegate = delegate
    }
}

extension RxUIAdaptivePresentationDelegateProxy: DelegateProxyType { }

extension RxUIAdaptivePresentationDelegateProxy: UIAdaptivePresentationControllerDelegate {
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        adaptiveWillDismiss.onNext(())
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        adaptiveDidDismiss.onNext(())
    }

    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        adaptiveDidAttemptToDismiss.onNext(())
    }
}
