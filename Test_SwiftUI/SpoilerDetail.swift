//
//  NewsDetail.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

struct SpoilerDetail : View {
    @EnvironmentObject var userData: UserData
    var spoiler: Spoiler
    var spoilerIndex: Int {
        userData.spoilers.firstIndex(where: { $0.id == spoiler.id })!
    }
    
    var body: some View {
        VStack {
            Text(spoiler.title)
                .font(.largeTitle)
            
            Text(spoiler.description)
                .lineLimit(nil)
                .font(.subheadline)
            
            Button(action: {
                self.userData.spoilers[self.spoilerIndex].isFavorite.toggle()
            }) {
                if !userData.spoilers[spoilerIndex].isFavorite {
                    Text("Não sou favorito")
                } else {
                    Text("Sou favorito")
                }
            }
        }
        .navigationBarTitle(Text("Vingador nº\(spoiler.id)"), displayMode: .inline)
        .padding()
    }
}

#if DEBUG
struct SpoilerDetail_Previews : PreviewProvider {
    static var previews: some View {
        SpoilerDetail(spoiler: spoilerList[0])
    }
}
#endif
