//
//  MinuteHand.swift
//  AnalogClock
//
//  Created by ServantOf ALLAH on 5/25/22.
//

import SwiftUI

struct MinuteHand:Shape {
    var minute:Int = 0
    var second:Int = 0
    
    var padding:CGFloat = 10
    
    private let offsetAngle:CGFloat = -90
    private let degreePerMinute:CGFloat = 360 / 60
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let minuteHandPoints = getPoints(rect: rect)
        
        path.move(to: minuteHandPoints.start)
        path.addLine(to: minuteHandPoints.end)
        return path
    }
    
    private func getPoints(rect:CGRect) -> (start:CGPoint,end:CGPoint) {
        let radius = min(rect.width,rect.height) / 2 - padding
        let tailLength:CGFloat = radius * 0.09
        let anlgeInRad = getAngleInRadians()
        
        let headX:CGFloat = rect.midX + (radius * cos(anlgeInRad))
        let headY:CGFloat = rect.midY + (radius * sin(anlgeInRad))
        
        let tailX:CGFloat = rect.midX + (tailLength * cos(anlgeInRad + CGFloat.pi))
        let tailY:CGFloat = rect.midY + (tailLength * sin(anlgeInRad + CGFloat.pi))
        
        return (CGPoint(x: headX, y: headY),CGPoint(x: tailX, y: tailY))
        
    }
    
    private func getAngleInRadians() -> Double {
        let secondAngle:CGFloat = (CGFloat(second) / 60) * degreePerMinute
        let totalAngle = (degreePerMinute * CGFloat(minute)) + secondAngle
        return Angle.degrees(totalAngle + offsetAngle).radians
    }
}

