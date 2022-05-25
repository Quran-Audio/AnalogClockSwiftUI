//
//  Dial.swift
//  AnalogClock
//
//  Created by ServantOf ALLAH on 5/25/22.
//

import SwiftUI

struct LineDial:Shape {
    private let anglePerMinute:CGFloat = 360 / 60
    private let totalNoOfMarks:Int = 60
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in 0..<totalNoOfMarks {
            let tickPoints = getPoints(rect: rect,minute:i)
            path.move(to: tickPoints.start)
            path.addLine(to: tickPoints.end)
        }
        return path
    }
    
    private func getPoints(rect:CGRect,
                           minute:Int) -> (start:CGPoint,end:CGPoint) {
        let radius = min(rect.width,rect.height) / 2
        let tickWidth:CGFloat = radius * 0.1
        var innerRadius = radius - tickWidth
        let anlgeInRad = getAngleInRadians(minute: minute)
        let quaterHightLightWidth:CGFloat = radius * 0.15
        
        
        if minute%15 == 0 {
            innerRadius = innerRadius - quaterHightLightWidth
        }else if minute%5 == 0 {
            innerRadius = innerRadius - (quaterHightLightWidth/2)
        }
        let outerX:CGFloat = rect.midX + (radius * cos(anlgeInRad))
        let outerY:CGFloat = rect.midY + (radius * sin(anlgeInRad))
        
        let innerX:CGFloat = rect.midX + (innerRadius * cos(anlgeInRad))
        let innerY:CGFloat = rect.midY + (innerRadius * sin(anlgeInRad))
        return (CGPoint(x: innerX, y: innerY),CGPoint(x: outerX, y: outerY))
    }
    
    private func getAngleInRadians(minute:Int) -> Double {
        let angle:CGFloat = anglePerMinute * CGFloat(minute)
        return Angle.degrees(angle).radians
    }
}
