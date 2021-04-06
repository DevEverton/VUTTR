//
//  ProgressBar.swift
//  VUTTR
//
//  Created by Everton Carneiro on 05/04/21.
//

import SwiftUI

struct ProgressBar: View {
    
    var value: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            if value > 0.9 {
                EmptyView()
                    .animation(.easeOut(duration: 2.0))
                    .frame(height: 0)
            } else {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.1)
                    Rectangle()
                        .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: geometry),
                               maxWidth: self.getProgressBarWidth(geometry: geometry))
                        .opacity(0.3)
                        .background(Color("red"))
                }
                .animation(.easeIn(duration: 2.0))
                .frame(height: 5)
            }

        }
    }

    
    func getProgressBarWidth(geometry: GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }

}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 0.9)
    }
}
