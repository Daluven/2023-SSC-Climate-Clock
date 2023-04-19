import SwiftUI

struct LibraryView: View {
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink() {
                        SourceView()
                    } label: {
                        Text("Sources and References")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
