//
//  TopView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 6/29/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct TopView: View {

    var body: some View {
      NavigationView {
        List() {
          NavigationLink(destination: ProblemsMain()) {
            Text("Algorithm Problems")
          }
          NavigationLink(destination: AlgorithmsMainView()) {
            Text("Sorting Algorithms")
          }
          NavigationLink(
            destination: DataStructuresMainView() ,
            label: {
              Text("Data Structures")
            })
        }
        .navigationBarTitle("Algorithms & Data Structures", displayMode: NavigationBarItem.TitleDisplayMode.inline)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
