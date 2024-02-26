//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ahmad Tri Putranto on 26/02/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}

