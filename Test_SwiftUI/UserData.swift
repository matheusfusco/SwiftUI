//
//  UserData.swift
//  Test_SwiftUI
//
//  Created by Matheus on 11/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var spoilers = spoilerList {
        didSet {
            didChange.send(self)
        }
    }
}
