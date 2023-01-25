//
//  Music_AppApp.swift
//  Music App
//
//  Created by Tyson Laroyce Walker II on 1/23/23.
//

import SwiftUI
import Firebase

@main
struct Music_AppApp: App {
    let data = OurData()
    
    init(){
        FirebaseApp.configure()
        data.loadAlbums()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
        }
    }
}
