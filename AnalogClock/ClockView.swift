//
//  ClockView.swift
//  AnalogClock
//
//  Created by ServantOf ALLAH on 5/25/22.
//

import SwiftUI

struct ClockView: View {
    var hourHandColor:Color = .green
    var minuteHandColor:Color = .orange
    var secondHandColor:Color = .red
    
    
    var lineDialColor:Color = .blue
    var numericDialColor:Color = .black
    @ObservedObject var viewModel = ClockVM()
    
    var color:Color = .blue
    var body: some View {
        ZStack {
            GeometryReader { geo in
                NumericDialView(width: geo.size.width,
                           height: geo.size.height)
                
                LineDial()
                    .stroke(lineDialColor.opacity(0.4),
                        style: StrokeStyle(lineWidth: 2))
                    .padding()
                
                HourHand(
                    hour: viewModel.hour,
                    minute: viewModel.minute,
                    padding: 60
                )
                .stroke(hourHandColor,
                        style: StrokeStyle(lineWidth: 5))
                
                MinuteHand(
                    minute: viewModel.minute,
                    second: viewModel.second,
                    padding: 40
                )
                .stroke(minuteHandColor,
                        style: StrokeStyle(lineWidth: 3))
                
                SecondHand(
                    second: viewModel.second,
                    padding: 30
                )
                .stroke(secondHandColor,
                        style: StrokeStyle(lineWidth: 2))
            }
        }
        .padding()
    }
}


struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
