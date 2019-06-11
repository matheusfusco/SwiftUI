//
//  NewsRow.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

struct SpoilerRow : View {
    var spoiler: Spoiler
    var body: some View {
        HStack {
            spoiler.image
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(1, contentMode: .fit)
            VStack {
                Text(spoiler.title)
                    .font(.largeTitle)
                Text(spoiler.subtitle)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if spoiler.isFavorite {
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
struct SpoilerRow_Previews : PreviewProvider {
    static var previews: some View {
        SpoilerRow(spoiler: Spoiler(id: spoilerList[0].id, image: spoilerList[0].image, title: spoilerList[0].title, subtitle: spoilerList[0].subtitle, description: spoilerList[0].description, isFavorite: spoilerList[0].isFavorite))
    }
}
#endif
