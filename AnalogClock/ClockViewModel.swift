//
//  ClockViewModel.swift
//  AnalogClock
//
//  Created by ServantOf ALLAH on 5/25/22.
//

import SwiftUI

class ClockVM: ObservableObject {
    @Published var second:Int = 0
    @Published var minute:Int = 0
    @Published var hour:Int = 0
    
    private var timer = Timer()
    init() {
        startTimer()
    }
}

//MARK: Timer Function
extension ClockVM {
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.updateTime),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func updateTime(){
        let date = Date()
        let calendar = Calendar.current
        hour = calendar.component(.hour, from: date)
        if hour > 12 {
            hour = hour - 12
        }
        minute = calendar.component(.minute, from: date)
        second = calendar.component(.second, from: date)
    }
}

