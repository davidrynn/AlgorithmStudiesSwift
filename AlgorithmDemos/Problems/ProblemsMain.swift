//
//  ProblemsMain.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 10/9/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct ProblemsMain: View {
  let algorithms = Algorithms()
  let algorithmsArray: [AlgorithmItem] =
    [
      ConvertRomanNumerals(algorithms: Algorithms()), PalindromeNumberCheck(algorithms: Algorithms())
    ]
  var body: some View {
    List(algorithmsArray, id: \.id) { item in
      NavigationLink(destination: AlgorithmDetail(item: item, title: item.id) ) {
        Text(item.id)
      }
    }
    .navigationBarTitle("Algorithms")

  }
}

struct ProblemsMain_Previews: PreviewProvider {
  static var previews: some View {
    ProblemsMain()
  }
}
