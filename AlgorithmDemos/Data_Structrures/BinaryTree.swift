//
//  BinaryTree.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/25/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct BinaryTree: View {
  typealias Key = CollectDict<TreeNode.ID, Anchor<CGPoint>>

  @State var coordinate = CGPoint.zero

  var treeNode: TreeNode = TreeNode(value: 0)
    var body: some View {
      VStack(alignment: .center) {
        TreeNodeView(treeNode: treeNode)
          .anchorPreference(key: Key.self, value: .center, transform: {
            [self.treeNode.id: $0]
          })
        HStack(alignment: .bottom, spacing: 10) {
          ForEach(treeNode.children, id: \.id, content: { node in
            BinaryTree(treeNode: node)
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

struct BinaryTree_Previews: PreviewProvider {
    static var previews: some View {
        BinaryTree()
    }
 }
