import SwiftUI

let SectionName = [
    "Surprise-Me", "Doodle-Zone", "Music-Zone", "Tips" 
]

struct NextView: View {
    let openViewName: String
    
    @ViewBuilder var body: some View {
        switch openViewName{
        case "Surprise-Me" :
            SurpriseView()
        case "Doodle-Zone" :
            DoodleView()
        case "Music-Zone" :
            MusicView()
        case "Tips" :
            TipsView()
        default:
            SurpriseView()
        }
    }
}
