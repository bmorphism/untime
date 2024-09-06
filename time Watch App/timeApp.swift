import SwiftUI

@main struct HyperduckApp: App {
    
    @State var state: HyperduckState = HyperduckState()
    
    var body: some Scene {
        WindowGroup {
            ContentView(state: $state)
        }
    }
    
}
