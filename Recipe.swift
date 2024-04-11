//
//  Recipe.swift
//  ReceitADA
//
//  Created by Lucas Dantas de Moura Carvalho on 10/04/24.
//

import Foundation

class Recipe: Identifiable {
    let id: UUID
    var name: String
    var level: Double
    var timeInMinutes: Int
    var imageName: String
    var ingredients: [String]
    var steps: [(name: String, text: String)]
    
    init(name: String, level: Double, timeInMinutes: Int, imageName: String, ingredients: [String], steps: [(name: String, text: String)]) {
        self.id = UUID()
        self.name = name
        self.level = level
        self.timeInMinutes = timeInMinutes
        self.imageName = imageName
        self.ingredients = ingredients
        self.steps = steps
    }
}

let storedRecipes = [
    Recipe(
        name: "File com Fritas",
        level: 4.5,
        timeInMinutes: 130,
        imageName: "FileComFritas",
        ingredients: ["File de frango", "Batatas", "Sal", "Pimenta", "Óleo"],
        steps: [
            ("Prepare the chicken", "Cut the chicken into pieces and marinate with salt and pepper."),
            ("Cook the fries", "Peel and cut the potatoes into strips. Fry them until golden brown."),
            ("Cook the chicken", "Grill or fry the chicken until cooked thoroughly."),
            ("Serve", "Arrange the chicken and fries on a plate. Sprinkle with additional salt and pepper if desired.")
        ]
    ),
    Recipe(
        name: "Hambúrguer",
        level: 2.5,
        timeInMinutes: 20,
        imageName: "Hamburguer",
        ingredients: ["Carne moída", "Pão de hambúrguer", "Queijo", "Alface", "Tomate"],
        steps: [
            ("Prepare the burger patties", "Season the ground beef and form into patties."),
            ("Cook the patties", "Grill or fry the patties until cooked to your preference."),
            ("Assemble the burger", "Place the cooked patties on buns and add cheese, lettuce, and tomato."),
            ("Serve", "Enjoy your homemade burger!")
        ]
    ),
    Recipe(
        name: "Kebab",
        level: 4.5,
        timeInMinutes: 40,
        imageName: "Kebab",
        ingredients: ["Carne de cordeiro", "Pão sírio", "Tomate", "Cebola", "Molho de iogurte"],
        steps: [
            ("Marinate the lamb", "Marinate the lamb meat with spices and yogurt."),
            ("Prepare the skewers", "Thread the marinated meat onto skewers with vegetables."),
            ("Grill the kebabs", "Grill the kebabs until the meat is cooked and tender."),
            ("Serve", "Serve the kebabs hot with a side of yogurt sauce.")
        ]
    ),
    Recipe(
        name: "Pasteis",
        level: 4.5,
        timeInMinutes: 35,
        imageName: "Pasteis",
        ingredients: ["Massa de pastel", "Carne moída", "Queijo", "Óleo para fritar"],
        steps: [
            ("Prepare the filling", "Cook the ground beef with onions and spices until browned."),
            ("Fill the pastries", "Place a spoonful of the beef mixture and cheese onto each pastry sheet."),
            ("Seal the pastries", "Fold the pastry sheets over the filling and crimp the edges with a fork."),
            ("Fry the pastries", "Heat oil in a pan and fry the pastries until golden and crispy."),
            ("Serve", "Serve the pastries hot with dipping sauce.")
        ]
    ),
    Recipe(
        name: "Pizza",
        level: 4.7,
        timeInMinutes: 25,
        imageName: "Pizza",
        ingredients: ["Massa de pizza", "Molho de tomate", "Queijo", "Presunto", "Azeitonas"],
        steps: [
            ("Prepare the dough", "Roll out the pizza dough and place it on a pizza pan."),
            ("Spread the sauce", "Spread a layer of tomato sauce evenly over the dough."),
            ("Add toppings", "Sprinkle grated cheese, sliced ham, and olives over the sauce."),
            ("Bake the pizza", "Preheat the oven and bake the pizza until the crust is golden and the cheese is bubbly."),
            ("Serve", "Slice the pizza and serve hot.")
        ]
    ),
    Recipe(
        name: "Quesadillas",
        level: 4.4,
        timeInMinutes: 30,
        imageName: "Quesadillas",
        ingredients: ["Tortillas", "Queijo cheddar", "Frango desfiado", "Tomate", "Creme de leite"],
        steps: [
            ("Prepare the filling", "Cook and shred the chicken. Slice the tomatoes and grate the cheese."),
            ("Assemble the quesadillas", "Place a tortilla on a skillet. Add cheese, chicken, tomatoes, and sour cream on one half of the tortilla."),
            ("Fold the tortilla", "Fold the other half of the tortilla over the filling to form a half-moon shape."),
            ("Cook the quesadillas", "Cook the quesadillas on both sides until the cheese is melted and the tortilla is crispy."),
            ("Serve", "Slice the quesadillas into wedges and serve hot with salsa and guacamole on the side.")
        ]
    ),
    Recipe(
        name: "Salada Caesar",
        level: 4.3,
        timeInMinutes: 115,
        imageName: "SaladaCeasar",
        ingredients: ["Alface romana", "Croutons", "Queijo parmesão", "Molho Caesar", "Peito de frango grelhado"],
        steps: [
            ("Prepare the salad", "Wash and chop the romaine lettuce into bite-sized pieces."),
            ("Grill the chicken", "Season the chicken breasts and grill until cooked through. Slice them into strips."),
            ("Assemble the salad", "In a large bowl, toss the lettuce with croutons, Parmesan cheese, and Caesar dressing."),
            ("Add the chicken", "Top the salad with grilled chicken strips."),
            ("Serve", "Serve the Caesar salad with extra dressing on the side.")
        ]
    ),
    Recipe(
        name: "Torta Alemã",
        level: 4.9,
        timeInMinutes: 50,
        imageName: "TortaAlema",
        ingredients: ["Biscoitos de chocolate", "Creme de leite", "Chocolate meio amargo", "Açúcar", "Manteiga"],
        steps: [
            ("Prepare the crust", "Crush the chocolate cookies into fine crumbs. Mix with melted butter and press into a pie dish."),
            ("Make the filling", "Melt chocolate and sugar together. Whip cream until stiff peaks form."),
            ("Combine", "Fold the chocolate mixture into the whipped cream and pour into the crust."),
            ("Chill", "Refrigerate the torte for several hours until set."),
            ("Serve", "Slice and serve the German torte chilled.")
        ]
    )
]

