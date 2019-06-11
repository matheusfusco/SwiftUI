//
//  NewsTableView.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

let customNews: [News] = [News(id: 1,
                               image: Image("ic-limit"),
                               title: "Capitão América",
                               subtitle: "O que aconteceu com ele?",
                               description: "Steve Rogers volta no tempo para deixar as jóias do infinito em seus devidos lugares e fica por lá para ter o romance que nunca pôde ter com Peggy Carter!",
                               isFavorite: false),
                          News(id: 2,
                               image: Image("ic-limit"),
                               title: "Homem de Ferro",
                               subtitle: "O que aconteceu com ele?",
                               description: "Tony Stark morre ao final de Vingagores Ultimato, após estalar os dedos com a manopla e se sacrificar para salvar o mundo!",
                               isFavorite: false)]

struct NewsTableView : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            Text("Aqui você encontra spoilers sobre os seus personagens favoritos do MCU! E aí, está preparado?")
                .lineLimit(nil)
                .padding()
                .multilineTextAlignment(.center)
            
            VStack {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Mostrar somente favoritos")
                }
            }.padding()
            List {
                ForEach(self.userData.news) { news in
                    if !self.userData.showFavoritesOnly || news.isFavorite {
                        NavigationButton(destination: NewsDetail(news: news)) {
                            NewsRow(news: news)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Spoilers!"))
        }
    }
}

#if DEBUG
struct NewsTableView_Previews : PreviewProvider {
    static var previews: some View {
        NewsTableView()
    }
}
#endif
