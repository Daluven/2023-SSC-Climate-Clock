import SwiftUI

struct ContentView: View {
    @State var timeRunning = false
    @StateObject var timeManager = TimeManager()
    var body: some View {
        TabView {
            TimerView(timeManager: TimeManager())
                .environmentObject(TimeManager())
                .tabItem {
                    Image(systemName: "stopwatch.fill")
                    Text("Timer")
                }
            
            LibraryView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Info")
                }
        }
    }
}
