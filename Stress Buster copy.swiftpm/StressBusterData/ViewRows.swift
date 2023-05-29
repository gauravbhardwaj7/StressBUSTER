import SwiftUI

struct ViewRows: View {
    let title: String
    let description: String
    let icon: String
    let bg = [Color(red: 0.01, green: 0.03, blue: 0.04), Color(red: 0.18, green: 0.18, blue: 0.31),Color(red: 0.08, green: 0.61, blue: 0.01),Color(red: 0.01, green: 0.01, blue: 0.01)]
    @State var bgAnimate = false
    
    @State var name: String = ""
    @FocusState var isFocused: Bool
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: bg), startPoint: bgAnimate ? .topLeading : .bottomLeading, endPoint: bgAnimate ? .bottomTrailing : .topTrailing)
                .ignoresSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.async {
                        withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: true)) {
                            bgAnimate.toggle()
                        }
                    }
                }
            HStack {
                
                Image(systemName: icon)
                    .frame(width: 40)
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    Text(description)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                .padding(10)
            }
        }
    }
    
}
