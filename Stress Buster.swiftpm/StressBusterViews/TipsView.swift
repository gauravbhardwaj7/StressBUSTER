import SwiftUI

struct TipsView: View {
    
    let bg = [Color(red: 0.01, green: 0.03, blue: 0.04), Color(red: 0.18, green: 0.18, blue: 0.31),Color(red: 0.05, green: 0.07, blue: 0.03),Color(red: 0.01, green: 0.01, blue: 0.01)]
    
    
    @State var bgAnimate = false
    
    @State var name: String = ""
    @FocusState var isFocused: Bool
    
    @State private var goBack = false
    
    var body: some View {
        if goBack{
            MainView()
        }
        
        else{
            ScrollView{
                ZStack {
                    
                    LinearGradient(gradient: Gradient(colors: bg), startPoint: bgAnimate ? .topLeading : .bottomLeading, endPoint: bgAnimate ? .bottomTrailing : .topTrailing)
                        .ignoresSafeArea(.all)
                        .onAppear {
                            DispatchQueue.main.async {
                                withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: true)) {
                                    bgAnimate.toggle()
                                }
                            }
                        }
                    VStack {
                        Text(info.healthFacts[0])
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        
                        Image(systemName:info.imageName[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width : 150 ,height : 150)
                        
                        
                        Text(info.healthFacts[1])
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        
                        
                        Image(systemName:info.imageName[1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width : 150 ,height : 150)
                        
                        
                        Text(info.healthFacts[2])
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        
                        Image(systemName:info.imageName[2])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width : 150 ,height : 150)
                        
                        Text(info.healthFacts[3])
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        
                        
                        Image(systemName:info.imageName[3])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width : 150 ,height : 150)
                        
                        Text(info.healthFacts[4])
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        
                        Image(systemName:info.imageName[4])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width : 130 ,height : 130)
                    }
                }
            }
            .padding()
            .navigationBarTitle(Text(""))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action:{
                goBack = true
                Sounds.audioPlayer?.stop()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            })
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
