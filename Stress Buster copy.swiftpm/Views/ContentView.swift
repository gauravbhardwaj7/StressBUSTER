import SwiftUI
import UIKit

struct ContentView: View {
    
    var body: some View {
        NavigationView {
           
            BeginningView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}



