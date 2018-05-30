//
//  ConcretePlayerContext+Rx.swift
//  ModernAVPlayer
//
//  Created by Jean-Charles Dessaint on 16/05/2018.
//

import RxCocoa
import RxSwift

public extension Reactive where Base: ModernAVPlayer {
    
    var delegate: DelegateProxy<ModernAVPlayer, ModernAVPlayerDelegate> {
        return RxPlayerContextDelegateProxy.proxy(for: base)
    }
    
    var state: Observable<ModernAVPlayer.State> {
        return RxPlayerContextDelegateProxy.proxy(for: base).stateSubject.asObservable()
    }
    
    var currentTime: Observable<Double?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).currentTimeSubject.asObservable()
    }
    
    var itemDuration: Observable<Double?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).itemDurationSubject.asObservable()
    }
    
    var debugMessage: Observable<String?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).debugMessageSubject.asObservable()
    }
    
    var currentItemUrl: Observable<URL?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).currentItemUrlSubject.asObservable()
    }
}