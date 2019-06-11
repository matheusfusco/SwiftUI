//
//  NewsRow.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

struct NewsRow : View {
    var news: News
    var body: some View {
        HStack {
            news.image
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(1, contentMode: .fit)
            VStack {
                Text(news.title)
                    .font(.largeTitle)
                Text(news.subtitle)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if news.isFavorite {
                Image("ic-limit")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
struct NewsRow_Previews : PreviewProvider {
    static var previews: some View {
        NewsRow(news: News(id: customNews[0].id, image: customNews[0].image, title: customNews[0].title, subtitle: customNews[0].subtitle, description: customNews[0].description, isFavorite: customNews[0].isFavorite))
    }
}
#endif
