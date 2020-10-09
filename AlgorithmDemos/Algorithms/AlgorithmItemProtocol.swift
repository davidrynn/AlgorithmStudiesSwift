//
//  AlgorithmItemProtocol.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 10/9/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

protocol AlgorithmItem {
  var id: String { get }
  var algorithms: Algorithms { get }
  func getAlgorithmOutput(input: [String]) -> String
  func validateInput(_ input: Any) -> Bool
}

protocol SortAlgorithmItem {

}
