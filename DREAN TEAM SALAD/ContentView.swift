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
            VStack {
                
                
                Text("SECRET SALAD")
                    .font(.largeTitle)
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
                        .padding(.top, 115)
                        .font(.largeTitle)
                        .bold()
                    
                    
//                    navigationTitle("ContentView")
                }
                
                
                
                
            }
        }
    }
}
#Preview {
    ContentView()
}
