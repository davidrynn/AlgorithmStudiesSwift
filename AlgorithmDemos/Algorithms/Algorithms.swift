//
//  Algorithms.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 6/29/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import Foundation
import SwiftUI

struct Algorithms {
//  func mergeRanges(meetings: [Meeting]) -> Meeting {
//    // take each meeting and compare start/end times with all other meetings.  If there's overlap, merge.
//    // then start over, until no changes to array.
//    var merged = [Meeting]()
//    var count = meetings.count
//    var newCount = count
//    while newCount != count {
//    for index in 0..<meetings.count {
//      for newIndex in index..<meetings.count {
//        merged.append(mergeMeeting(first: meetings[index], second: meetings[newIndex]))
//        }
//      }
//    }
//  }
//
//  private func mergeMeeting(first: Meeting, second: Meeting) -> Meeting {
//    let start: Int
//    let end: Int
//    if first.startTime <= second.startTime || first.endTime >= second.endTime {
//      start =
//    let end = first.endTime >= second.endTime ? first.endTime :
//    return Meeting(startTime: start, endTime: end)
//  }
  static func reverseString(str: inout [Character]) {
    let count = str.count
    for index in 0..<(str.count/2) {
      let swapper = str[index]
      str[index] = str[count - index]
      str[count - index] = swapper
    }
  }
   static func reverse(_ str: inout [Character]) {

      guard str.count > 0 else {
          return
      }

      var leftIndex  = 0
      var rightIndex = str.count - 1

      while leftIndex < rightIndex {

          // swap characters
          let leftChar  = str[leftIndex]
          let rightChar = str[rightIndex]

          str[leftIndex] = rightChar
          str[rightIndex] = leftChar

          // move towards middle
          leftIndex  += 1
          rightIndex -= 1
      }
  }

  static func reverseInt(_ x: Int32) -> Int32 {
    var isNegative = false
    var n = Int(x)
    var result = 0
    if n < 0 {
      n *= -1
      isNegative = true
    }
    while n > 0 {
      let mod = n % 10
      n = (n - mod)/10
      result = (result * 10) + mod
    }
    if isNegative { result *= -1}
    if result > Int32.max { return 0}
    if result < Int32.min { return 0}

    return Int32(result)
  }

  static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var returnArray = [Int]()
      let range = 0...(nums.count - 1)
    var dict = [Int : Int]()
    range.forEach { dict[nums[$0]] = $0 }
      range.forEach { index in
          let complement = target - nums[index]
        if let comp = dict[complement], comp != index {
          returnArray = [index, comp]
        }
      }
              return returnArray
  }

  func isPalindromeNumber(_ x: Int) -> Bool {
      if x < 0 { return false }
      var n = x
      var result = 0
      while n > 0 {
          let mod = n % 10
          result = result*10 + mod
          n = n/10
      }
      return result == x
  }

  func convertRoman(_ s: String) -> Int {
    let characterArray = Array(s)
    var returnValue = 0
    let trans: [ Character: Int] = [
      "I": 1,
      "V": 5,
      "X": 10,
      "L": 50,
      "C": 100,
      "D": 500,
      "M": 1000
    ]
    var last = 0
    (0...characterArray.count-1).forEach { index in
      guard let current = trans[characterArray[index]] else {
        print("invalid character")
        return
      }
      if last < current {
        //error code
        guard (last == 0 || (current/last == 10 && (current/10 % 10 == 0 ))) || (current/last == 5 && ((current/5 % 10 == 0 ) || current/5 == 1)) else {
          print("Invalid precedent")
          return
        }
        returnValue = returnValue + (current - last) - last
      }
      else {
        returnValue += current
      }
      last = current
    }
    return returnValue
  }

  /* Bubble Sort */
  //MARK: - Bubble Sort
  func bubbleSort(unordered: [Int], startCount: Int = 0, iterations: [[Int]] = []) -> (array: [Int], iterations: [[Int]]) {
    if startCount == unordered.count - 1 { return (array: unordered, iterations: iterations) }
    var passArray = unordered
    let count = unordered.count - startCount
    var swapCount = 0
    (0...(count - 2)).forEach {
      if passArray[$0] > passArray[$0 + 1] {
        passArray.swapAt($0, $0 + 1)
        swapCount += 1
      }
    }
    var newIteration = iterations
    newIteration.append(passArray)
    //optimization
    if swapCount == 0 { return (array: passArray, iterations: newIteration)}
    return bubbleSort(unordered: passArray, startCount: startCount + 1, iterations: newIteration)
  }

  /* Merge Sort */
//MARK: - Merge Sort
  func mergeSort(unordered: [Int]) -> [Int] {
    if unordered.count < 1 { return unordered }
    return []
  }


/*
   Quicksort
   */
  func quickSort(_ qsarray: [Int], iterations: Int) -> (array: [Int], iterations: Int){
    print("quicksort fired")
    if qsarray.count < 3 { return (array: qsarray, iterations: iterations) }
    let partitioned = partition(qsarray: qsarray)
    let lowArray = Array(partitioned.array[0..<partitioned.pivot])
    let highArray = Array(partitioned.array[partitioned.pivot..<partitioned.array.count])
      let lowreturn = quickSort(lowArray, iterations: iterations + 1)
      let highreturn = quickSort(highArray, iterations: iterations + 1)
    return (array: lowreturn.array + highreturn.array, iterations: lowreturn.iterations + highreturn.iterations + partitioned.iterations)
  }
  private func partition(qsarray: [Int]) -> (pivot: Int, array: [Int], iterations: Int) {
    var ordered = qsarray
    let pivot = qsarray[qsarray.count - 1]
    var lowIndex = 0
    var highIndex = qsarray.count - 1
    var iterations = 0
    while lowIndex < highIndex {
      iterations += 1
      var lowerNumber = ordered[lowIndex]
      var higherNumber = ordered[highIndex]
      while  lowerNumber < pivot {
        iterations += 1
        if lowIndex >= highIndex { break }
        lowIndex += 1
        lowerNumber = ordered[lowIndex]
      }
      while  higherNumber >= pivot {
        iterations += 1
        if lowIndex >= highIndex { break }
        highIndex -= 1
        higherNumber = ordered[highIndex]
      }
      if lowIndex < highIndex {
        ordered.swapAt(lowIndex, highIndex)
      }
    }
    ordered.swapAt(highIndex, ordered.count - 1 )
    return (pivot: highIndex, array: ordered, iterations: iterations)
  }
}

protocol AlgorithmItem {
  var id: String { get }
  var algorithms: Algorithms { get }
  func getAlgorithmOutput() -> String
}

struct Quicksort: AlgorithmItem {
  var id = "Quicksort"
  var algorithms: Algorithms

  func getAlgorithmOutput() -> String {
    let qsarray = [ 10, 80, 30, 90, 40, 50, 70 ]
    let firstPart = qsarray.debugDescription
    let ordered = algorithms.quickSort(qsarray, iterations: 0)
    let secondPart = ordered.array.debugDescription
    return "Original array: "
      + firstPart
      + "\nAfter quicksort: "
      + secondPart
      + "\nwith \(ordered.iterations) iterations"
  }

}

struct BubbleSort: AlgorithmItem {
  var id = "Bubble Sort"
  var algorithms: Algorithms

  func getAlgorithmOutput() -> String {
    let unordered = [ 90, 80, 70, 50, 40, 30, 10 ]
    let ordered = algorithms.bubbleSort(unordered: unordered)
    var iterationsString = "Worst Case with \(unordered):\n"
    (0...(ordered.iterations.count - 1)).forEach {
      iterationsString += "\nIteration \($0 + 1): \(ordered.iterations[$0])"
    }
    let unordered2 = [ 10, 30, 40, 50, 70, 80, 90]
    let ordered2 = algorithms.bubbleSort(unordered: unordered2)
    var iterationsString2 = "\n\nBest Case with \(unordered2):\n"
    (0...(ordered2.iterations.count - 1)).forEach {
      iterationsString2 += "\nIteration \($0 + 1): \(ordered2.iterations[$0])"
    }

    return iterationsString + iterationsString2
  }
}

struct ConvertRomanNumerals: AlgorithmItem {
  var id = "Convert Roman Numerals"
  var algorithms: Algorithms

  func getAlgorithmOutput() -> String {
    return "IV is " + algorithms.convertRoman("IV").description
  }

}

struct PalindromeNumberCheck: AlgorithmItem {
  var id: String = "Check if a number is a palindrome"
  var algorithms: Algorithms

  func getAlgorithmOutput() -> String {
    let number = 211232112
    let isPalindrome: String = algorithms.isPalindromeNumber(211232112) ? "a palindrome" : "not a palindrome"
    return "\(number) is \(isPalindrome)"
  }
}

/*
 Nodes
 */


//class ListNode:Node {
//  var value: Int
//  let next: ListNode?
//
//  init(_ value: Int, next: ListNode?) {
//    self.value = value
//    self.next = next
//  }
//}
//
//struct LinkedList {
//  let head: ListNode
//}
//
//class BinaryTreeNode: Node {
//  var value: Int
//
//  let left: BinaryTreeNode?
//  let right: BinaryTreeNode?
//
//  init(_ value: Int, left: BinaryTreeNode?, right: BinaryTreeNode?) {
//    self.value = value
//    self.left = left
//    self.right = right
//  }
//}
//
//struct BinaryTree {
//  let head: BinaryTreeNode
//}

