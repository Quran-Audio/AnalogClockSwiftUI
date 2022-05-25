//
//  HourHand.swift
//  AnalogClock
//
//  Created by ServanOfALLAH on 5/25/22.
//

import SwiftUI

struct HourHand:Shape {
    var hour:Int = 0
    var minute:Int = 0
    var padding:CGFloat = 10

    private let offsetAngle:CGFloat = -90
    private let degreePerHour:CGFloat = 360 / 12
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let hourHandPoints = getPoints(rect:rect)
        
        path.move(to: hourHandPoints.start)
        path.addLine(to: hourHandPoints.end)
        return path
    }
    
    private func getPoints(rect:CGRect) -> (start:CGPoint,end:CGPoint) {
        let radius = min(rect.width,rect.height) / 2 - padding
        let tailLength:CGFloat = radius * 0.09
        
        let anlgeInRad = getAngleInRadians()
        
        let headX:CGFloat = rect.midX + (radius * cos(anlgeInRad))
        let headY:CGFloat = rect.midY + (radius * sin(anlgeInRad))
        
        let tailX:CGFloat = rect.midX + (tailLength * cos(anlgeInRad+CGFloat.pi))
        let tailY:CGFloat = rect.midY + (tailLength * sin(anlgeInRad+CGFloat.pi))
        
        return (CGPoint(x: headX, y: headY),CGPoint(x: tailX, y: tailY))
        
    }
    
    private func getAngleInRadians() -> Double {
        let minuteAngle:CGFloat = (CGFloat(minute) / 60) * degreePerHour
        let totalAngle:CGFloat = (degreePerHour * CGFloat(hour)) + minuteAngle
        return Angle.degrees(totalAngle + offsetAngle).radians
    }
}

