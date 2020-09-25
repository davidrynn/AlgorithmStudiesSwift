//
//  TreeContentView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/21/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct TreeContentView: View {
  @State var treeNode: TreeNode
  @State private var showingSheet = false

  var body: some View {
    VStack {
      Button(action: {
          self.showingSheet = true
      }) {
          Text("Show Action Sheet")
      }
      .actionSheet(isPresented: $showingSheet) {
          ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
      }
      TreeDiagram(treeNode: treeNode)
    }
  }
}

struct TreeContentView_Previews: PreviewProvider {
  static var previews: some View {
    let binaryTree = TreeNode(value: 50, children: [
      TreeNode(value: 17, children: [
        TreeNode(value: 12),
        TreeNode(value: 23)
      ]),
      TreeNode(value: 72, children: [
        TreeNode(value: 54),
        TreeNode(value: 72)
      ])
    ])
    TreeContentView(treeNode: binaryTree)
  }
}

