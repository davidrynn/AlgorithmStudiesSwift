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
  @State var isShowingAlert = true
  @State var currentArray: [Int] = []
  @State var inputText = ""
    var body: some View {
      VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
        TextField("Input an Int", text: $inputText, onCommit: {
          if let valid = Int(inputText) {
            currentArray.append(valid)
            outputText = item.getAlgorithmOutput(input: currentArray)
          } else {
            outputText = "Invalid Integer, please try again"
          }
        }).fixedSize()
        Text(self.currentArray.debugDescription)
      Text(outputText)
      }
//      .textFieldAlert(isShowing: isShowingAlert, text: inputText, title: "Input an unsorted array", buttonAction: {
//        let input = inputText.components(separatedBy: ",").compactMap { Int($0) }
//        self.outputText = item.getAlgorithmOutput(input: input)
//      })
    }
}

struct AlgorithmDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmDetail(item: Quicksort(algorithms: Algorithms()))
    }
}
