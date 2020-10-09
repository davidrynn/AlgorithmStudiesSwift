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
  @State var currentArray: [String] = []
  @State var inputText = ""
  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 40) {
      HStack(alignment: .center, spacing: 20) {
        Button("Calculate") {
          outputText = item.getAlgorithmOutput(input: currentArray)
        }
        .padding()
        .foregroundColor(.green)
        .border(Color.green)
        Button("Delete Last") {
          currentArray.removeLast()
        }
        .padding()
        .foregroundColor(.red)
        .border(Color.red)
        Button("Clear") {
          currentArray = []
        }
        .padding()
        .foregroundColor(.blue)
        .border(Color.blue)
        
      }
      TextField("Input a value", text: $inputText, onCommit: {
        if item.validateInput(_input: inputText) {
          currentArray.append(inputText)
        } else {
          outputText = "Invalid Integer, please try again"
        }
      })
      .fixedSize()
      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
      .padding()
      Text("Current input: " + self.currentArray.debugDescription)
      Text("Final: " + outputText)
    }
    
  }
}

struct AlgorithmDetail_Previews: PreviewProvider {
  static var previews: some View {
    AlgorithmDetail(item: Quicksort(algorithms: Algorithms()))
  }
}
