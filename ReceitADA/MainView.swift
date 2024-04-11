//
//  MainView.swift
//  ReceitADA
//
//  Created by Lucas Dantas de Moura Carvalho on 10/04/24.
//

import SwiftUI

struct MainView: View {
    @State var recipes: [Recipe] = storedRecipes

    var body: some View {
        List($recipes) { $recipe in
            NavigationLink (destination: RecipeView(recipe: $recipe)){
                RecipeRowView(recipe: $recipe)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Receitas")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            NavigationLink(destination: NewRecipeView(recipes: $recipes)) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.yellow)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RecipeRowView: View {
    @Binding var recipe: Recipe

    var body: some View {
        HStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                    .fontWeight(.regular)
                starStack(of: recipe.level)
            }
            Spacer()
            Text(formatTime(timeInMinutes: recipe.timeInMinutes))
                .foregroundColor(.gray)
        }
    }
}

func starStack(of level: Double) -> some View {
    let fullStarCount = Int(level)
    let halfStar: Bool = level - Double(fullStarCount) >= 0.5
    // true se tem um .5 .6 .7... na nota
    let emptyStarCount = 5 - fullStarCount - (halfStar ? 1 : 0)
    
    return HStack(spacing: 0) {
        ForEach(0..<fullStarCount) { _ in
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
        
        if halfStar {
            Image(systemName: "star.fill.left")
                .foregroundColor(.yellow)
        }
        
        ForEach(0..<emptyStarCount) { _ in
            Image(systemName: "star")
                .foregroundColor(.yellow)
        }
    }
}

func formatTime(timeInMinutes: Int) -> String {
    let hours = timeInMinutes / 60
    let minutes = timeInMinutes % 60
    
    if hours > 0 {
        return "\(hours)h \(minutes)min"
    } else {
        return "\(minutes)min"
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
