//
//  2 page .swift
//  DREAN TEAM SALAD
//
//  Created by Maryna Sunko on 2/1/24.
//



struct SaladImage: Identifiable {
    
    var id:String
    var image:String
}

struct SaladIngredients {
    var id:String
    var name:String
    var ingredients:String
}
import SwiftUI

struct page: View {
    
    
    
    var saladImages:[SaladImage] = [
    
    SaladImage(id: "1", image: "cobb"),
    SaladImage(id: "2", image: "caesar"),
    SaladImage(id: "3", image: "greek")
    ]
    
    
    var saladIngredients:[SaladIngredients] = [
       SaladIngredients(id: "1", name: "cobb salad", ingredients: "")
        
    ]
    
    var body: some View {
        ZStack {
            Image ("BACKGROUND")
            
            VStack {
                HStack{
                    
                    Button {
                        
                    }label: {
                        
                        Rectangle()
                            .frame(width:100)
                            .frame(height: 50)
                            .foregroundColor(.green)
                            .opacity(0.4)
                            .cornerRadius(10)
                            .overlay {
                                Text ("NEW GAME")
                                    .foregroundStyle(.black)
                                
                            }
                        
                            .padding(.trailing,130)
                            .padding(.bottom, 80)
                        
                        
                        
                    }
                    Button {
                        
                    }label: {
                        
                        Rectangle()
                            .frame(width:100)
                            .frame(height: 50)
                        
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .opacity(0.4)
                            .overlay {
                                Text ("HISTORI")
                                    .foregroundStyle(.black)
                                    
                            }
                            .padding(.bottom, 80)
                        
                        
                    }

                    
                }
                HStack {
              
                    VStack {
                        ForEach(saladImages) { salad in
                            Rectangle()
                                .frame(width:100)
                                .frame(height: 50)
                            
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .opacity(0.4)
                                .padding(.trailing, 100)
                                .padding(.bottom, 50)
                        }
  //
                    }
                    
                    VStack {
                        ForEach(saladImages) { salad in
                            Rectangle()
                                .frame(width:100)
                                .frame(height: 50)
                            
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .opacity(0.4)
                                .padding(.bottom, 50)
                        }
                        
                    }
                }
            }
        }
        
    }
}

#Preview {
    page()
    
}
