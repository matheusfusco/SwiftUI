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
    @State private var showingAlert: Bool = false
    var spoiler: Spoiler
    var spoilerIndex: Int {
        userData.spoilers.firstIndex(where: { $0.id == spoiler.id })!
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                spoiler.image
                Spacer()
                VStack {
                    Button(action: {
                        self.userData.spoilers[self.spoilerIndex].isFavorite.toggle()
                        self.showingAlert = self.userData.spoilers[self.spoilerIndex].isFavorite
                    }) {
                        if !userData.spoilers[spoilerIndex].isFavorite {
                            Image("ic-star")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                        } else {
                            Image("ic-star-fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .aspectRatio(1, contentMode: .fit)
                        }
                        }
                        .frame(width: 25, height: 25)
                }
            }
            
            Text(spoiler.title)
                .font(.largeTitle)
            
            Text(spoiler.description)
                .lineLimit(nil)
                .font(.subheadline)
            Spacer()
        }
        .navigationBarTitle(Text("Vingador nº\(spoiler.id)"), displayMode: .inline)
        .presentation($showingAlert) {
            Alert(title: Text("\(spoiler.title) agora é um dos seus vingadores favoritos!"))
        }
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
