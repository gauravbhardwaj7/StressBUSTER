import SwiftUI

struct MainView: View {
    
    @State private var goBack = false
    @State private var goToSurprise = false
    @State private var goToDoodle = false
    @State private var goToTips = false
    @State private var goToMusic = false
    
    
    var body: some View {
        
        return Group {
            if goBack {
                MainView()
            }
            else if goToSurprise {
                SurpriseView()
            }
            else if goToDoodle {
                DoodleView()
            }
            else if goToTips {
                TipsView()
            }
            else if goToMusic {
                MusicView()
            }
            else {
                VStack {
                    Text("Tap the zone you want to dive into")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding()
                    List {
                        Group {
                            
                            
                            ViewRows(title: "Positivity Zone", description: "Positive vibes only", icon: "sun.and.horizon")
                            
                            
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                goToSurprise = true
                            }
                        }
                        
                        .padding()
                        Group {
                            
                            
                            ViewRows(title: "Music Zone", description: "Time to relax", icon: "beats.headphones")
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        goToMusic = true
                                    }
                                }
                        }
                        .padding()
                        Group {
                            
                            
                            ViewRows(title: "Doodle Zone", description: "Time for creativity", icon: "pencil.tip")
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        goToDoodle = true
                                    }
                                }
                        }
                        .padding()
                        Group {
                            
                            
                            ViewRows(title: "Tips", description: "Tips to reduce stress", icon: "book")
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        goToTips = true
                                    }
                                }
                        }
                        .padding()
                        
                    }
                    
                    
                    .padding(.vertical, 10)
                }
                
                
            }
            
            
            
            
        }
        
    }
}
