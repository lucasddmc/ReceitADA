//
//  LandingView.swift
//  ReceitADA
//
//  Created by Lucas Dantas de Moura Carvalho on 09/04/24.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.yellow)
                    .ignoresSafeArea()
                    .frame(height: 200)
                    .cornerRadius(20.0)
                Text("Receitada")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Text("Você com a colher, nós com as dicas!")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "carrot.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("Explore deliciosas receitas na palma da sua mão e torne-se le chef que sempre quis ser!")
                        .font(.footnote)
                        .frame(width: 280, height: 60)
                }
                HStack {
                    Image(systemName: "vial.viewfinder")
                        .resizable()
                        .foregroundColor(.yellow)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("Navegue por categorias, encontre receitas por ingredientes ou explore os favoritos dos chefs!")
                        .font(.footnote)
                        .frame(width: 280, height: 60)
                }
                HStack {
                    Image(systemName: "list.bullet.clipboard")
                        .resizable()
                        .foregroundColor(.yellow)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("Siga instruções passo a passo, com imagens e dicas úteis para criar pratos perfeitos.")
                        .font(.footnote)
                        .frame(width: 280, height: 60)
                }
                HStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("Guarde suas receitas favoritas e compartilhe suas criações culinárias com amigos e familiares.")
                        .font(.footnote)
                        .frame(width: 280, height: 60)
                }
                Image("FileComFritas")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 120.0)
                    .cornerRadius(20)
                    .padding(.vertical)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            NavigationLink(destination: MainView()) {
                Text("Começar a cozinhar")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity, maxHeight: 60.0)
            }
            .background(Color(.yellow))
            .cornerRadius(10)
            .padding()
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    LandingView()
}
