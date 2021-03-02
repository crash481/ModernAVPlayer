// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ConcretePlayerContext+Rx.swift
// Created by Jean-Charles Dessaint on 16/05/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// Compilation failed from SPM without this import
import ModernAVPlayer
import CombineCocoa
import Combine

public extension Reactive where Base: ModernAVPlayer {
    
    var delegate: DelegateProxy<ModernAVPlayer, ModernAVPlayerDelegate> {
        return CombinePlayerContextDelegateProxy.proxy(for: base)
    }
    
    var state: AnyPublisher<ModernAVPlayer.State, Never> {
        return CombinePlayerContextDelegateProxy.proxy(for: base).stateSubject.any()
    }
    
    var currentMedia: AnyPublisher<PlayerMedia?, Never> {
        return CombinePlayerContextDelegateProxy.proxy(for: base).currentMediaSubject.any()
    }
    
    var currentTime: AnyPublisher<Double, Never> {
        return CombinePlayerContextDelegateProxy.proxy(for: base).currentTimeSubject.any()
    }
    
    var itemDuration: AnyPublisher<Double?, Never> {
        return CombinePlayerContextDelegateProxy.proxy(for: base).itemDurationSubject.any()
    }
    
    var unavailableActionReason: AnyPublisher<PlayerUnavailableActionReason, Never> {
        return CombinePlayerContextDelegateProxy.proxy(for: base).unavailableActionSubject.any()
    }
    
    var itemPlayToEndTime: AnyPublisher<Double, Never> {
        return CombinePlayerContextDelegateProxy.proxy(for: base).itemPlayToEndTimeSubject.any()
    }
}
