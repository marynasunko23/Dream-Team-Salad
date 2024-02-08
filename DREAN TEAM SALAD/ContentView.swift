//
//  ContentView.swift
//  DREAN TEAM SALAD
//
//  Created by Maryna Sunko on 1/31/24.
//
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
//            ZStack {
//                Image ("BACKGROUND")
                VStack {
//                    
                    
                    Text("SECRET SALAD")
                        .font(.largeTitle)
                        .shadow(color: .black, radius: 2, x:0, y: 2)
                    
                        .bold()
                        .foregroundStyle(.green)
                    ZStack {
                        Image ("salad")
                           
                        
                            .padding()
                        
                        
                        Button{
                        } label:{
                            
                            Text ("START")
                        }
                        //.buttonStyle(.bordered)
                        .tint(.red)
                        .shadow(color: .black, radius: 2, x:0, y: 2)
                    
                        .padding(.top, 115)
                        .font(.largeTitle)
                        .bold()
                        
                        
                        //                    navigationTitle("ContentView")
//                    }
                    
                }
                
                
            }
        }
    }
}
#Preview {
    ContentView()
}
