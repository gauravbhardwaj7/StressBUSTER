

import Foundation
import SwiftUI

var personName = ""

struct BeginningView: View {
    
    
    @State var max = false
    let starting: CGFloat = 0.7
    
    let bg = [Color(red: 0.01, green: 0.03, blue: 0.04), Color(red: 0.18, green: 0.18, blue: 0.31),Color(red: 0.05, green: 0.07, blue: 0.03),Color(red: 0.01, green: 0.01, blue: 0.01)]
    @State var bgAnimate = false
    
    @State var name: String = ""
    @FocusState var isFocused: Bool
    
    
    var body: some View {
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
            
            VStack(spacing: 5) {
                ScrollView {
                    
                    Text("Be Kind to your mind!")
                        .font(.system(size: 65, weight: .semibold, design: .serif))
                        .padding(.bottom)
                    Text("Register yourself to experience a refreshing journey for your mind.")
                        .frame(maxWidth: 460)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, weight: .semibold, design: .default))
                    
                    
                    
                }
                .frame(maxHeight: 250)
                .foregroundColor(Color(red: 0.76, green: 0.78, blue: 0.90))
                .padding(.bottom,100)
                
                ZStack {
                    Color.purple.opacity(0.14)
                    HStack {
                        ZStack(alignment: .leading) {
                            if name.isEmpty {
                                Text("Username(Optional)")
                                    .foregroundColor(Color.gray)
                                    .padding()
                            }
                            TextField("", text: $name)
                                .padding()
                                .focused($isFocused)
                                .onChange(of: name) {_ in
                                    DispatchQueue.main.async {
                                        personName = name
                                    }
                                }
                        }
                        Spacer()
                        
                        Button {
                            isFocused = false
                        } label: {
                            Text("Enter")
                        }
                        .padding(.trailing)
                        
                        
                    }
                }
                .foregroundColor(Color.white)
                .frame(maxWidth: 350, maxHeight: 52)
                .cornerRadius(15)
                .padding()
                
                
                
                NavigationLink {
                    MainView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100.0, style: .continuous)
                            .fill(Color.purple.opacity(0.3))
                            .frame(width: 150, height: 50)
                        
                        
                        Text("Let's Go")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(Color.white)
                        
                    }
                    .ignoresSafeArea(.keyboard)
                    .frame(maxHeight: 300)
                }
                
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        }
        
    }
}
