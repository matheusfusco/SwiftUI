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
        HStack(spacing: 16) {
            spoiler.image
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(1, contentMode: .fit)
            VStack(alignment: .leading) {
                Text(spoiler.title)
                    .font(.title)
                Text(spoiler.subtitle)
                    .font(.footnote)
            }
            
            Spacer()
            
            if spoiler.isFavorite {
                Image("ic-star-fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .aspectRatio(1, contentMode: .fit)
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
