//
//  NasaPictureOfTheDayApp.swift
//  NasaPictureOfTheDay
//
//  Created by David Tacite on 24/05/2022.
//

import SwiftUI

@main
struct NasaPictureOfTheDayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
