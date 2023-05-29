
import SwiftUI
import PencilKit


struct DoodleView : View {
    
    @State private var goBack = false
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .yellow
    @State var type : PKInkingTool.InkType = .pen
    @State var isViewExplanation = true
    
    
    var body: some View{
        if goBack{
            MainView()
        }
        
        else{
            VStack{
                ZStack{
                    DoodleDrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                    VStack{
                        HStack{
                            
                            ColorPicker("", selection: $color)
                            Text("Color")
                                .frame( alignment : .leading)
                                .foregroundColor(.black)
                                .onChange(of: color) { newValue in
                                    isDraw = true
                                    
                                }
                            
                        }  
                        
                        
                        
                        .padding(.trailing, 5)
                        .padding(.bottom, 5)
                        HStack{
                            Spacer()
                            
                            Button(action: {
                                isDraw = true
                                type = .pen
                            }){
                                Image(systemName: "scribble")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.black)
                                Text("Pen")
                                    .frame( alignment : .leading)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        .padding(.bottom, 5)
                        
                        
                        
                        
                        HStack{
                            Spacer()
                            Button(action:{
                                isDraw = false
                            }, label: {
                                Image(systemName: "rectangle.portrait")
                                    .font(.system(size: 40, weight: .bold))
                                    .foregroundColor(Color.black)
                                    .overlay(
                                        Image(systemName: "rectangle.roundedtop.fill")
                                            .font(.system(size: 28, weight: .bold))
                                            .foregroundColor(Color.black)
                                            .padding(.bottom, 30)
                                    )
                            })
                            Text("Eraser")
                                .frame( alignment : .leading)
                                .foregroundColor(.black)
                        }
                        .padding(.bottom, 5)
                        Spacer()
                    }
                    .padding(.all,85)
                    
                }
                
                
                .overlay(
                    VStack{
                        Text("Doodle Zone")
                            .font(.system(size: 50, weight: .semibold, design: .serif))
                            .opacity(isViewExplanation ? 1.4 : 0)
                            .animation(Animation.easeOut, value: isViewExplanation)
                        
                        Text("Take your creativity to another level...")
                            .font(.body)
                            .padding(.top,5)
                            .opacity(isViewExplanation ? 1.2 : 0)
                            .animation(Animation.easeOut, value: isViewExplanation)
                    }
                        .foregroundColor(Color.black)
                    
                    
                )
                .ignoresSafeArea(.all, edges: [.bottom,.top])
                .background(Color.black)
                
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    self.isViewExplanation = false
                }
            }
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


struct DoodleDrawingView : UIViewRepresentable{
    
    
    @Binding var canvas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type : PKInkingTool.InkType
    @Binding var color : Color
    
    
    var ink : PKInkingTool{
        PKInkingTool(type,color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDraw ? ink : eraser
        canvas.backgroundColor = UIColor(Color(red: 0.90, green: 0.90, blue: 0.98))
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
        uiView.tool = isDraw ? ink : eraser
    }
}
