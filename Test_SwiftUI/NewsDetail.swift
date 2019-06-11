//
//  NewsDetail.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

struct NewsDetail : View {
    @EnvironmentObject var userData: UserData
    var news: News
    var newsIndex: Int {
        userData.news.firstIndex(where: { $0.id == news.id })!
    }
    
    var body: some View {
        VStack {
            Text(news.title)
                .font(.largeTitle)
            
            Text(news.description)
                .lineLimit(nil)
                .font(.subheadline)
            
            Button(action: {
                self.userData.news[self.newsIndex].isFavorite.toggle()
            }) {
                if !userData.news[newsIndex].isFavorite {
                    Text("Não sou favorito")
                } else {
                    Text("Sou favorito")
                }
            }
        }
        .navigationBarTitle(Text("Vingador nº\(news.id)"), displayMode: .inline)
        .padding()
    }
}

#if DEBUG
struct NewsDetail_Previews : PreviewProvider {
    static var previews: some View {
        NewsDetail(news: customNews[0])
    }
}
#endif
