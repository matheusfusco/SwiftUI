//
//  NewsTableView.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

let whatHappenedToHim = "O que aconteceu com ele?"
let spoilerList: [Spoiler] = [Spoiler(id: 1,
                               image: Image("ic-cap-america"),
                               title: "Capitão América",
                               subtitle: whatHappenedToHim,
                               description: "Steve Rogers volta no tempo para deixar as jóias do infinito em seus devidos lugares e fica por lá para ter o romance que nunca pôde ter com Peggy Carter!",
                               isFavorite: false),
                          Spoiler(id: 2,
                               image: Image("ic-iron-man"),
                               title: "Homem de Ferro",
                               subtitle: whatHappenedToHim,
                               description: "Tony Stark morre ao final de Vingagores Ultimato, após estalar os dedos com a manopla e se sacrificar para salvar o mundo!",
                               isFavorite: false),
                          Spoiler(id: 3,
                                  image: Image("ic-hulk"),
                                  title: "Hulk",
                                  subtitle: whatHappenedToHim,
                                  description: "Banner se 'funde' com Hulk, se tornando o Professor Hulk, e usa a Manopla do Infinito criada por Tony Stark para reviver todos os mortos por Thanos pelo estalar de dedos ao fim de Guerra Infinita.",
                                  isFavorite: false)]

struct SpoilerList : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            HStack {
                Image("ic-avengers-logo")
                    .frame(width: 25, height: 25, alignment: .center)
                Text("\n\n\n qui você encontra spoilers sobre os seus personagens favoritos do MCU! E aí, está preparado?")
                    .lineLimit(nil)
            }.padding()
            
            
            VStack {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Mostrar somente favoritos")
                }
            }.padding()
            List {
                ForEach(self.userData.spoilers) { spoiler in
                    if !self.userData.showFavoritesOnly || spoiler.isFavorite {
                        NavigationButton(destination: SpoilerDetail(spoiler: spoiler)) {
                            SpoilerRow(spoiler: spoiler)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Spoilers!"))
        }
    }
}

#if DEBUG
struct SpoilerList_Previews : PreviewProvider {
    static var previews: some View {
        SpoilerList()
    }
}
#endif
