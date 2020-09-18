//
//  AlgorithmDetail.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/18/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct AlgorithmDetail: View {
  var item: AlgorithmItem
  @State var outputText: String = "calculating..."
    var body: some View {
      Text(outputText)
        .onAppear {
          self.outputText = self.item.getAlgorithmOutput()
        }
    }
}

struct AlgorithmDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmDetail(item: Quicksort(algorithms: Algorithms()))
    }
}
