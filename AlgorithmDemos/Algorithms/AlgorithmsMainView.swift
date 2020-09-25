//
//  AlgorithmsMainView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/23/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct AlgorithmsMainView: View {
  let algorithms = Algorithms()
  let algorithmsArray: [AlgorithmItem] = [Quicksort(algorithms: Algorithms()), ConvertRomanNumerals(algorithms: Algorithms()), PalindromeNumberCheck(algorithms: Algorithms()), BubbleSort(algorithms: Algorithms())]
    var body: some View {
      NavigationView {
      List(algorithmsArray, id: \.id) { item in
        NavigationLink(destination: AlgorithmDetail(item: item) ) {
          Text(item.id)
        }
      }
      }
    .navigationBarTitle("Algorithms")

    }
}

struct AlgorithmsMain_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmsMainView()
    }
}
