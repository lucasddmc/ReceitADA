//
//  AddRecipeView.swift
//  ReceitADA
//
//  Created by Lucas Dantas de Moura Carvalho on 06/04/24.
//

import SwiftUI


struct NewRecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    let scoreSelectionOptions: [Double] = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
    @Binding var recipes: [Recipe]
    
    @State var name = ""
    @State var level = 0.0
    @State var timeInMinutes = 0
    @State var imageName = ""
    @State var ingredients = [""]
    @State var steps: [(name: String, text: String)] = [("", "")]
    
    var body: some View {
        Text("Nova receita")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 30)
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    customTextField(placeHolder: "Nome", text: $name)
                        .padding(.bottom, 10)
                    customTextField(placeHolder: "Nome da imagem", text: $imageName)
                        .padding(.bottom, 20)
                    Text("Dificuldade")
                        .fontWeight(.semibold)

                    Picker("Score picker", selection: $level) {
                        ForEach(scoreSelectionOptions, id: \.self) { level in
                            if level.truncatingRemainder(dividingBy: 1) == 0 {
                                Image(systemName: "star.fill")
                            } else {
                                HStack {
                                    Image(systemName: "star.fill.left")
                                }
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.trailing, 30)

                    Text("Ingredientes")
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                    ForEach(Array(ingredients.enumerated()), id: \.offset) { index, ingredient in
                        customTextField(placeHolder: "Ingrediente \(index + 1)", text: $ingredients[index])
                    }
                    Button(action: {
                        ingredients.append("")
                    }) {
                        Text("Adicionar mais um item")
                            .font(.caption)
                    }
                    
                    Text("Passo a Passo")
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                    ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                        customTextField(placeHolder: "Nome do passo \(index + 1)", text: $steps[index].name)
                            .padding(.top, index == 0 ? 0 : 20)
                        customTextField(placeHolder: "Texto do passo \(index + 1)", text: $steps[index].text)
                    }
                    Button(action: {
                        steps.append((name: "", text: ""))
                    }) {
                        Text("Adicionar mais um item")
                            .font(.caption)
                            .padding(.bottom, 30)
                    }
                }
                .padding(.vertical, 30)
                .padding(.leading, 30)
            }
        }
        Button(action: {
            let newRecipe: Recipe = Recipe(name: name, level: level, timeInMinutes: timeInMinutes, imageName: imageName, ingredients: ingredients, steps: steps)
            recipes.append(newRecipe)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Salvar Receita")
                .foregroundColor(.black)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
        .background(.yellow)
        .cornerRadius(10)
        .padding(.horizontal, 30)
        .padding(.bottom, 10)
    }
}

struct customTextField: View {
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                TextField(placeHolder, text: $text)
                Spacer()
                if text != "" {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                    }
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                }
            }
            .padding(.vertical, 3)
            Divider()
        }
    }
}

#Preview {
    NavigationStack {
        NewRecipeView(
            recipes: .constant(storedRecipes)
        )
    }
}
