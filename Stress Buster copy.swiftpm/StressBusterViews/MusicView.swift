

import SwiftUI
import AVFoundation


struct MusicView: View {
    let bg = [Color(red: 0.01, green: 0.03, blue: 0.04), Color(red: 0.18, green: 0.18, blue: 0.31),Color(red: 0.05, green: 0.07, blue: 0.03),Color(red: 0.01, green: 0.01, blue: 0.01)]
    @State var bgAnimate = false
    
    @State var name: String = ""
    @FocusState var isFocused: Bool
    
    @State private var goBack = false
    @State var textColor : Color = Color.white
    
    
    
    
    var body: some View{
        
        if goBack{
            MainView()
        }
        
        else{
            
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
                
                
            }
            .background(Color.black)
            .overlay(
                VStack{
                    HStack(spacing: 20){
                        Text("Join the Chill Wave")
                            .font(.system(size: 65, weight: .semibold, design: .serif))
                            .padding(.top,30)
                            .foregroundColor(textColor)
                        
                        Image(systemName:"beats.headphones")
                            .resizable()
                            .frame(width : 100 ,height : 100)
                        
                    } 
                   
                }
                    .onAppear{
                        Sounds.playAudio()
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
            )
            
            
            
            
            
        }
        
        
    }
    
}


struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
