//
//  NumericDialView.swift
//  AnalogClock
//
//  Created by ServantOf ALLAH on 5/25/22.
//

import SwiftUI

struct NumericDialView:View {
    var width:CGFloat
    var height:CGFloat
    
    private let degreePerHour:CGFloat = 360 / 12
    
    var body: some View {
        GeometryReader { geo in
            let points = getPoints()
            ZStack {
                ForEach(Array(zip(points.indices, points)),
                        id: \.1) { index, point in
                    Text("\(index+1)")
                        .position(x: point.x, y: point.y)
                }
            }
        }
        
    }
    
    private let offsetAngle:CGFloat = -60
    
    func getPoints() -> [CGPoint] {
        var points:[CGPoint] = []
        for i in 0..<12 {
            let point = getPoint(index: i)
            points.append(point)
        }
        return points
    }
    
    private func getPoint(index:Int) -> CGPoint {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let radius = min(rect.width,rect.height) / 2
        let anlgeInRad = getAngleInRadians(index: index)
        let outerX:CGFloat = rect.midX + (radius * cos(anlgeInRad))
        let outerY:CGFloat = rect.midY + (radius * sin(anlgeInRad))
        
        return CGPoint(x: outerX, y: outerY)
        
    }
    
    private func getAngleInRadians(index:Int) -> Double {
        let totalAngle:CGFloat = degreePerHour * CGFloat(index)
        return Angle.degrees(totalAngle + offsetAngle).radians
    }
}

extension CGPoint : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
