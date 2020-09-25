//
//  TreeNode.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/21/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import Foundation

class TreeNode: Node, Identifiable {
  let id: UUID
  var value: Int
  var children: [TreeNode]

  init(id: UUID = UUID(), value: Int, children: [TreeNode] = []) {
    self.id = id
    self.value = value
    self.children = children
  }
}
