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

struct SaladIngredients: Identifiable {
    var id:String
    var name:String
    var ingredients:String
}
import SwiftUI

struct page: View {
    
    
   @State var correctSaladImages:[SaladImage] = []
    @State var correctSaladIngredients:[SaladIngredients] = []
    
  @State  var saladImages:[SaladImage] = [
        
        SaladImage(id: "1", image: "COUSCOUS"),
        SaladImage(id: "2", image: "FATTOUSH"),
        SaladImage(id: "3", image: "MEXICAN FRUIT"),
        SaladImage(id: "4", image: "OLIVIER"),
        SaladImage(id: "5", image: "CAESAR")
    ]
    
    
  @State  var saladIngredients:[SaladIngredients] = [
        SaladIngredients(id: "1", name: "COUSCOUS", ingredients: "Roasted chickpeas, smoked paprika, olive oil, lemon juice, couscous, cherry tomatoes, garlic fresh herbs cucumbers feta cheese"),
        SaladIngredients(id: "2", name: "FATTOUSH", ingredients: "Romaine lettuce, pita bread, cucumbers, cherry tomatoes, red radishes, fresh mint, parsley leaves, sumac, pomegranate, molasses"),
        SaladIngredients(id: "3", name: "MEXICAN FRUIT", ingredients: "Watermelon, cantaloupe, pineapple, mangos cucumbers, jícama, limes ,tajin, chamoy, sauce, chile, powder, salt"),
        SaladIngredients(id: "4", name: "OLIVIER", ingredients: "Cooked potatoes, carrots, eggs, meat, pickles, sweet onion, frozen or fresh peas, cucumber, mayo, salt"),
        
        SaladIngredients(id: "5", name: "CAESAR", ingredients: "Romaine lettuce, chicken breast or shrimp, parmesan cheese, french baguette, garlic, worcestershire sauce, extra virgin, olive oil, fresh lemon juice, wine vinegar salt, black pepper")
        
        
    ]
    
    @State var imageSelected = ""
    @State var saladIngredientsSelected = ""
    @State var gameText = "Secret Salad"
    @State private var showingSheet = false

     
             
    
    func checkIFMatch() {
        
        
        if imageSelected != "" && saladIngredientsSelected != "" {
            
            
            if imageSelected == saladIngredientsSelected {
                gameText = "You got it right!"
                    
                
                saladIngredients.removeAll { salad in
                    salad.id == saladIngredientsSelected
                }
                
                saladImages.removeAll { salad in
                    correctSaladImages.append(salad)
                   return  salad.id == imageSelected
                    
                    
                    
                }
                
            } else {
                gameText = "Oops try again"
                    
                    
            }
            imageSelected = ""
            saladIngredientsSelected = ""
                
        }
    }
    
    var body: some View {
       
        ZStack {
            Image ("BACKGROUND")
            
            VStack {
                
//                HStack {
//
//                    Text("Image \(imageSelected)")
//                    Text("Ingredient\(saladIngredientsSelected)")
//                }
                
                Text(gameText)
//                    .foregroundStyle(.color,.green)
                HStack{
                    
                    Button {
                        
                        saladIngredients.shuffle()
                        saladImages.shuffle()
                        
                    
                    }label: {
                        
                        Rectangle()
                        
                            .frame(width:100)
                            .frame(height: 50)
                            .foregroundColor(.greenbutton)
                            .opacity(0.8)
                            .cornerRadius(10)
                            .overlay {
                                Text ("NEW GAME")
                                    .foregroundStyle(.black)
                                
                            }
                        
                            .padding(.trailing,130)
                            .padding(.bottom, 80)
                        
                        
                        
                    }
                    Button {
                        showingSheet.toggle()
                        
                    }label: {
                        
                        Rectangle()
                            .frame(width:100)
                            .frame(height: 50)
                        
                            .foregroundColor(.greenbutton)
                            .cornerRadius(10)
                            .opacity(0.8)
                            .overlay {
                                Text ("HISTORY")
                                    .foregroundStyle(.black)
                                
                            }
                            .padding(.bottom, 80)
                        
                        
                    }
                    
                    
                }
                HStack {
                    
                    VStack {
                        ForEach(saladImages) { salad in
                            
                            Button {
                                imageSelected = salad.id
                                checkIFMatch()
                            } label: {
                                Rectangle()
                                    .frame(width:100)
                                    .frame(height: 100)
                                    .foregroundColor(.green)
                                    .cornerRadius(10)
                                    .opacity(0.4)
                                    .overlay {
                                        Image(salad.image)
                                            .resizable()
                                        
                                        
                                    }
                            }
                        }
                        
                        Button{
                        } label:{
                                
                           
                            Image (systemName:"arrow.left")
                                .padding()
                                .foregroundColor(.green)
                                .bold()
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x:0, y: 5)
 }
                            

                    }
                    
                    .padding()
//                    .padding(.bottom,45)
                    
                    Spacer()
                    VStack {
                        ForEach(saladIngredients) { salad in
                            
                            Button {
                                saladIngredientsSelected = salad.id
                                checkIFMatch()
                            } label: {
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
                        Button{
                        } label:{
                            
                            Image (systemName:"arrow.right")
                                .padding()
                                .foregroundColor(.green)
                                .bold()
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x:0, y: 5)
                        }
                        }
                    .padding()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x:0, y: 5)
                    }
                }
            .sheet(isPresented: $showingSheet, content: {
                HistoryView(correctIngredients: $correctSaladIngredients)
            })
           
        }
            
        }
}
    
    #Preview {
        page()
        
    }
    

