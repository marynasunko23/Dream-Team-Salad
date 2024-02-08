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
            ZStack {
                
                Color(.green)
                    .ignoresSafeArea()
                    .opacity(1)
                VStack {
                    
                    

                    Text("SECRET SALAD")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        
                    ZStack {
                        Image ("salad")
                        
                            .padding()
                        
                      

                        Button{
                        } label:{
                            
                            Text ("START")
                        }
                        //.buttonStyle(.bordered)
                        .tint(.red)
                        .padding(.top, 115)
                        .font(.largeTitle)
                        .bold()
                        
                       
                    }

                }
            }
        }
    }
}
#Preview {
    ContentView()
}
