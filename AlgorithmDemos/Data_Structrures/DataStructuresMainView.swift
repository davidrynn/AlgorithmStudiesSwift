//
//  DataStructuresMainView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/23/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct DataStructuresMainView: View {

    var body: some View {
        List() {
          NavigationLink("Tree", destination: TreeContentView())
          NavigationLink("Test 1", destination: TestView())
          NavigationLink("Test 2", destination: TestView2())
        }
    }
}

struct DataStructuresMainView_Previews: PreviewProvider {
    static var previews: some View {
        DataStructuresMainView()
    }
}
