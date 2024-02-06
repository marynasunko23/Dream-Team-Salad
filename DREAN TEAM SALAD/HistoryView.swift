//
//  HistoryView.swift
//  DREAN TEAM SALAD
//
//  Created by Maryna Sunko on 2/5/24.
//

import SwiftUI

struct HistoryView: View {
     @Binding var correctIngredients:[SaladIngredients] 
    //var saladIngredients:[]
    
    
    var body: some View {
        ForEach(correctIngredients) { salad in
          
                Rectangle()
                    .frame(width:170)
                    .frame(height: 100)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                    .opacity(0.4)
                    .overlay {
                        
                        VStack {
                            Text(salad.name)
                                .font(.caption)
                        
                                .bold()
                            
                            Text (salad.ingredients)
                                .font(.caption2)
                        }
                        .foregroundStyle(.black)
                    }
            

                }
    }
}

//#Preview {
//    HistoryView()
//}
