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

  @State var show: Bool = false

  var treeNodeView: TreeNodeView
  var duration: Double = 0
  var delay: Double = 0
  var body: some View {
    Group
    {
      self.treeNodeView
        .anchorPreference(key: Key.self, value: .center, transform: {
          [self.treeNodeView.treeNode.id: $0]
        })
        .opacity(show ? 1 : 0)
        .animation(Animation.easeOut(duration: duration).delay(delay))
        .onAppear {
          self.show = true
          print("delay: \(self.delay)")
        }
      HStack(alignment: .bottom, spacing: 10) {
        ForEach(treeNodeView.treeNode.children, id: \.id, content: { node in
          TreeDiagram(treeNodeView: TreeNodeView(treeNode: node), duration: 0.1, delay: self.delay + 0.4)
        })
      }

    }
    .backgroundPreferenceValue(CollectDict<TreeNode.ID, Anchor<CGPoint>>.self, { (centers: [TreeNode.ID: Anchor<CGPoint>]) in
      GeometryReader { proxy in
        ForEach(self.treeNodeView.treeNode.children, id: \.id, content: { child in
          EdgeView(start: proxy[centers[self.treeNodeView.treeNode.id]!],
                   end: proxy[centers[child.id]!])
            .opacity(show ? 1 : 0)
            .animation(Animation.easeOut(duration: 0.5).delay(delay + 0.3))
        })
      }
    })
  }
  mutating func incrementedDelay() -> Double {
    delay += 0.4
    return delay
  }
}

struct TreeDiagram_Previews: PreviewProvider {
  static var previews: some View {
    let node = TreeNode(id: UUID(), value: 72, children: [TreeNode(id: UUID(), value: 13, children: [])])
    //    let node = BinaryTreeNode(id: UUID(), value: 72, left: BinaryTreeNode(id: UUID(), value: 13, left: nil, right: nil), right: nil)
    TreeDiagram(treeNodeView: TreeNodeView(treeNode: node))
  }
}

struct CollectDict<Key: Hashable, Value>: PreferenceKey {
  static var defaultValue: [Key:Value] { [:] }
  static func reduce(value: inout [Key:Value], nextValue: () -> [Key:Value]) {
    value.merge(nextValue(), uniquingKeysWith: { $1 })
  }
}
