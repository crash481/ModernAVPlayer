//
//  InterruptionAudioService.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 03/05/2018.
//

import AVFoundation

final class ModernAVPlayerInterruptionAudioService {
    
    // MARK: - Outputs
    
    var onInterruptionBegan: (() -> Void)?
    var onInterruptionEnded: (() -> Void)?
    
    // MARK: - Variables
    
    private let notificationName = Notification.Name.AVAudioSessionInterruption
    
    // MARK: - Init
    
    init() {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(incomingInterruption),
                                               name: notificationName,
                                               object: nil)
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
    
    @objc
    private func incomingInterruption(notification: Notification) {
        LoggerInHouse.instance.log(message: "Audio interruption detected", event: .info)
        
        guard
            let userInfo = notification.userInfo,
            let rawInterruptionType = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let interruptionType = AVAudioSessionInterruptionType(rawValue: rawInterruptionType)
            else { return }
        switch interruptionType {
        case .began:
            onInterruptionBegan?()
        case .ended:
            onInterruptionEnded?()
        }
    }
}