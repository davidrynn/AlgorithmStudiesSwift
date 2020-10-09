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
  let title: String
  @State var outputText: String = "When ready, press \"Calculate\" button"
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
          if currentArray.count > 0 {
            currentArray.removeLast()
            inputText = ""
          }
        }
        .padding()
        .foregroundColor(.red)
        .border(Color.red)
        Button("Clear") {
          currentArray = []
          inputText = ""
        }
        .padding()
        .foregroundColor(.blue)
        .border(Color.blue)
        
      }
      TextField("Input a value", text: $inputText, onCommit: {
        if item.validateInput(inputText) {
          currentArray.append(inputText)
          inputText = ""
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
    .navigationBarTitle(title)
  }
}

struct AlgorithmDetail_Previews: PreviewProvider {
  static var previews: some View {
    AlgorithmDetail(item: Quicksort(algorithms: Algorithms()), title: "QuickSort")
  }
}
