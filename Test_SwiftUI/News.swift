//
//  News.swift
//  Test_SwiftUI
//
//  Created by Matheus on 10/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

struct News: Identifiable {
    var id: Int
    var image: Image
    var title: String
    var subtitle: String
    var description: String
    var isFavorite: Bool
}
