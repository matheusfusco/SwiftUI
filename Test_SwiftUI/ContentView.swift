//
//  ContentView.swift
//  Test_SwiftUI
//
//  Created by Matheus on 04/06/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
