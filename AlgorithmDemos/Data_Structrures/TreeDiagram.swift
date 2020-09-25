//
//  TreeDiagram.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/21/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct TreeDiagram: View {

  typealias Key = CollectDict<TreeNode.ID, Anchor<CGPoint>>

  var treeNode: TreeNode
    var body: some View {
      VStack(alignment: .center) {
        TreeNodeView(value: treeNode.value)
          .anchorPreference(key: Key.self, value: .center, transform: {
            [self.treeNode.id: $0]
          })
        HStack(alignment: .bottom, spacing: 10) {
          ForEach(treeNode.children, id: \.id, content: { node in
            TreeDiagram(treeNode: node)
          })
        }
      }
      .backgroundPreferenceValue(CollectDict<TreeNode.ID, Anchor<CGPoint>>.self, { (centers: [TreeNode.ID: Anchor<CGPoint>]) in
                  GeometryReader { proxy in
                      ForEach(self.treeNode.children, id: \.id, content: { child in
                        EdgeView(start: proxy[centers[self.treeNode.id]!],
                             end: proxy[centers[child.id]!])
                      })
                  }
              })
    }
}




struct TreeDiagram_Previews: PreviewProvider {
  static var previews: some View {
    let node = TreeNode(id: UUID(), value: 72, children: [TreeNode(id: UUID(), value: 13, children: [])])
//    let node = BinaryTreeNode(id: UUID(), value: 72, left: BinaryTreeNode(id: UUID(), value: 13, left: nil, right: nil), right: nil)
    TreeDiagram(treeNode: node)
  }
}

struct CollectDict<Key: Hashable, Value>: PreferenceKey {
  static var defaultValue: [Key:Value] { [:] }
  static func reduce(value: inout [Key:Value], nextValue: () -> [Key:Value]) {
    value.merge(nextValue(), uniquingKeysWith: { $1 })
  }
}
