//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Ahmad Tri Putranto on 13/03/24.
//

import Foundation
import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemainging: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemainging
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemainging / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading, content: {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                })
                Spacer()
                VStack(alignment: .trailing, content: {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(secondsRemainging)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                })
            }
        }
        .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemainging: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
