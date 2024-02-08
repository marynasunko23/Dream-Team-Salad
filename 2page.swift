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

struct pageOne: View {
    
    
   @State var correctSaladImages:[SaladImage] = []
    @State var correctSaladIngredients:[SaladIngredients] = []
    
    
    @State var currentGameSaladImages:[SaladImage] = []
     @State var currentGameSaladIngredients:[SaladIngredients] = []
    
  @State  var saladImages:[SaladImage] = [
        
        SaladImage(id: "1", image: "COUSCOUS"),
        SaladImage(id: "2", image: "FATTOUSH"),
        SaladImage(id: "3", image: "MEXICAN FRUIT"),
        SaladImage(id: "4", image: "OLIVIER"),
        SaladImage(id: "5", image: "CAESAR"),
        SaladImage(id: "6", image: "ASPARAGUS"),
        SaladImage(id: "7", image: "GREEK"),
        SaladImage(id: "8", image: "WALDORF"),
        SaladImage(id: "9", image: "KALE"),
        SaladImage(id: "10", image: "PASTA")
        
        
    ]
    
    
  @State  var saladIngredients:[SaladIngredients] = [
        SaladIngredients(id: "1", name: "COUSCOUS", ingredients: "Roasted chickpeas, smoked paprika, olive oil, lemon juice, couscous, cherry tomatoes, garlic fresh herbs cucumbers feta cheese"),
        SaladIngredients(id: "2", name: "FATTOUSH", ingredients: "Romaine lettuce, pita bread, cucumbers, cherry tomatoes, red radishes, fresh mint, parsley leaves, sumac, pomegranate, molasses"),
        SaladIngredients(id: "3", name: "MEXICAN FRUIT", ingredients: "Watermelon, cantaloupe, pineapple, mangos cucumbers, jícama, limes ,tajin, chamoy, sauce, chile, powder, salt"),
        SaladIngredients(id: "4", name: "OLIVIER", ingredients: "Cooked potatoes, carrots, eggs, meat, pickles, sweet onion, frozen or fresh peas, cucumber, mayo, salt"),
        
        SaladIngredients(id: "5", name: "CAESAR", ingredients: "Romaine lettuce chicken breast or shrimp  parmesan cheese french baguette garlic worcestershire sauce extra virgin olive oil fresh lemon juice wine vinegar salt black pepper"),
        SaladIngredients(id: "6", name: "ASPARAGUS", ingredients: "Fresh ginger rice wine vinegar vegetable oil  brown sugar soy sauce  fresh lime juice asian/toasted sesame oil pepper medium asparagus scallions cilantro mint sesame seeds sliced almonds"),
        SaladIngredients(id: "7", name: "GREEK", ingredients: "Large tomatoes cucumber red onion green bell pepper Kalamata olives  Feta cheese extra virgin olive oil salt dried oregano"),
        SaladIngredients(id: "8", name: "WALDORF", ingredients: " Sweet apple, red grapes, raisins, sliced celery, toasted walnuts, mayonnaise, lemon juice"),
        SaladIngredients(id: "9", name: "KALE", ingredients: "Kale  shredder beet  carrot  avocado watermelon radish   cranberries roasted chickpeas toasted pepitas and sesame seeds salt and pepper extra-virgin olive oil and fresh lemon juice"),
        
        SaladIngredients(id: "10", name: "PASTA", ingredients: "Fusilli pasta cherry tomatoes  cooked chickpeas arugula persian cucumbers crumbled feta cheese basil leaves minced parsley chopped mint toasted pine nuts extra-virgin olive oil lemon juice")
        
    ]
    
    @State var imageSelected = ""
    @State var saladIngredientsSelected = ""
    @State var gameText = "Secret Salad"
    @State var gameTextColor = Color.green
    @State private var showingSheet = false
//    @State private var score = 0
    @State var score = 0

     
             
    
    func checkIFMatch() {
 
        if imageSelected != "" && saladIngredientsSelected != "" {
            if imageSelected == saladIngredientsSelected {
                gameText = "You got it right!"
                gameTextColor = Color(.green)
                score += 1
                    
                currentGameSaladIngredients.removeAll { salad in
                    salad.id == saladIngredientsSelected
                }
                
                currentGameSaladImages.removeAll { salad in
                    correctSaladImages.append(salad)
                   return  salad.id == imageSelected
                }
                
            } else {
                gameText = "Oops try again"
                gameTextColor = Color(.red)
                    
                    
            }
            imageSelected = ""
            saladIngredientsSelected = ""
                
        }
    }
    
    func startNewGame() {
        score = 0
    currentGameSaladImages = []
    currentGameSaladIngredients = []
        
        for index in 1...5 {
            currentGameSaladImages.append(saladImages[index])
            currentGameSaladIngredients.append(saladIngredients[index])
        }
        
        currentGameSaladImages.shuffle()
        currentGameSaladIngredients.shuffle()
    }
    
    var body: some View {
       
        ZStack {
//            VStack {
//                Color(.green)
//                    .ignoresSafeArea()
//                Spacer()
//            }
            Image ("BACKGROUND")
            
            VStack {
                
//                HStack {
//
//                    Text("Image \(imageSelected)")
//                    Text("Ingredient\(saladIngredientsSelected)")
//                }
                
            Text(gameText)               
                    .foregroundColor(.white)
                    .font(.title2)
                   .frame(maxWidth: .infinity)
                   .background(Color.greenbutton)
                   .padding(.bottom)
                   
                HStack{
                    
                    Button {
                        
                        startNewGame()
                        
                        
                    }label: {
                        
                        Rectangle()
                        
                            .frame(width:100)
                            .frame(height: 50)
                            .foregroundColor(.greenbutton)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.black, Color.white] ), startPoint: .leading, endPoint: .trailing)
                                    .cornerRadius(15))
                            .opacity(0.8)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 2, x:0, y: 2)
                            .overlay {
                                
                                Text ("NEW GAME")
                                    .shadow(color: .black, radius: 2, x:0, y: 2)
                                
                                    .foregroundStyle(.white)
                                
                            }
                        
                        Spacer()
                        Text("Score \(score)")
                            .foregroundStyle(Color.greenbutton)
                        Spacer()
                        //                        Button ("NEW GAME:\ (score)"<#PrimitiveButtonStyleConfiguration#>)
                        //                                               score = 0
                        
                        
                    }
                    Button {
                        showingSheet.toggle()
                        
                    }label: {
                        
                        Rectangle()
                            .frame(width:100)
                            .frame(height: 50)
                        
                            .foregroundColor(.greenbutton)
                            .cornerRadius(10)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.white, Color.black] ), startPoint: .leading, endPoint: .trailing) //
                                    .cornerRadius(15) )
                            .opacity(0.8)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 2, x:0, y: 2)
                            .overlay {
                                Text ("HISTORY")
                                    .shadow(color: .black, radius: 2, x:0, y: 2)
                                
                                    .foregroundStyle(.white)
                                
                                
                            }
                        
                        
                    }
                }
                .padding()
                HStack {
                    
                    VStack {
                        ForEach(currentGameSaladImages) { salad in
                            
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
                                    .shadow(color: .black, radius: 5, x:0, y: 5)
                                    .overlay {
                                        Image(salad.image)
                                            .resizable()
                                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                        
                                        
                                    }
                            }
                        }
   
                       
                    }
                    
                    .padding()
                    Spacer()
                    VStack {
                        ForEach(currentGameSaladIngredients) { salad in
                            
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

                        }
                    .padding()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x:0, y: 5)
                    }
                }
            .sheet(isPresented: $showingSheet, content: {
                HistoryView(correctIngredients: saladIngredients, correctImages: saladImages)
            })
           
        }
            
        }
}
    
    #Preview {
        pageOne()
        
    }
    

