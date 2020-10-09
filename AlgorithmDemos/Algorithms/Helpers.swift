//
//  Helpers.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 10/9/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import Foundation

struct Helpers {

  static func validateStringAsInteger(_ input: String) -> Bool {
    return Int(input) != nil
  }

}

extension Array where Element == String {
  func convertToIntegers() -> [Int] {
    self.compactMap { Int($0) }
  }
}

extension String {
  func isValidInteger(_ input: String) -> Bool {
    return Int(self) != nil
  }
}
