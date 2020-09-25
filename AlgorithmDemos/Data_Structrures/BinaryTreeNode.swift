//
//  BinaryTreeNode.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/23/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import Foundation

class BinaryTreeNode: TreeNode {
  var left: BinaryTreeNode?
  var right: BinaryTreeNode?
  override var children: [TreeNode] {
    get {
      return [left, right].compactMap{ $0 }
    }
    set {}
  }
  init(id: UUID = UUID(), value: Int, left: BinaryTreeNode?, right: BinaryTreeNode?) {
    super.init(id: id, value: value)
    self.left = left
    self.right = right
  }
}
