import SwiftUI

struct SurpriseView: View {
    
    @State private var surpriseFact = ""
    @State private var goBack = false
    
    
    var body: some View{
        if goBack{
            MainView()
        }
        
        else{
            VStack {
                Group{
                    
                    Text("Click on Surprise Me!")
                        .font(.system(size: 65, weight: .semibold, design: .serif))
                    
                    
                    
                    Text(surpriseFact)
                        .padding()
                        .font(.title)
                        .frame(minHeight: 400)
                    
                    
                }
                .padding(.bottom)
                .foregroundColor(Color(red: 0.76, green: 0.78, blue: 0.90))
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 100.0, style: .continuous)
                        .fill(Color.purple)
                        .frame(width: 110, height: 40)
                    
                    
                    Button("Surprise Me!") 
                    {
                        surpriseFact = information.surpriseFacts.randomElement()!
                        
                    }
                    .foregroundColor(.white)
                    
                }
            }
            .padding()
            .navigationBarTitle(Text(""))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action:{
                goBack = true
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            })
        }
    }
}
struct FunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        SurpriseView()
    }
}
