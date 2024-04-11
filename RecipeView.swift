//
//  RecipeView.swift
//  ReceitADA
//
//  Created by Lucas Dantas de Moura Carvalho on 06/04/24.
//

import SwiftUI

struct RecipeView: View {
    @Binding var recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<3) { _ in
                        Image(recipe.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 190)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Dificuldade")
                        .fontWeight(.bold)
                    starStack(of: recipe.level)
                        .padding(.bottom)
                    IngredientsView(recipe: recipe)
                        .padding(.bottom, 30)
                    Text("Passo a passo")
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    ForEach(0..<recipe.steps.count, id: \.self) {index in
                        Text("\(index + 1). \(recipe.steps[index].name)")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                        Text("\(recipe.steps[index].text)")
                            .padding(.bottom)
                    }
                    
                }
                .padding(20)
            }
        }
        .navigationTitle(recipe.name)
        .toolbar {
            Button(action: {}) {
                Image(systemName: "heart")
            }
        }
    }
}


struct IngredientsView: View {
    var recipe: Recipe
    let iterationNum1: Int
    let iterationNum2: Int
 
    init(recipe: Recipe) {
        self.recipe = recipe
        self.iterationNum1 = Int(Double(recipe.ingredients.count) / 2 + 0.5)
        self.iterationNum2 = recipe.ingredients.count / 2
    }
    
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Ingredientes")
                .fontWeight(.bold)
                .padding(.bottom, 15)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(0..<iterationNum1, id: \.self) { index in
                        Text("\u{2022} \(recipe.ingredients[index * 2])")
                    }
                }.padding(.trailing, 20)
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(0..<iterationNum2, id: \.self) { index in
                        Text("\u{2022} \(recipe.ingredients[index * 2 + 1])")
                    }
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        RecipeView(recipe: .constant(storedRecipes[4]))
    }
}
