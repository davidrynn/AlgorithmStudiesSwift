//
//  TreeNodeView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/23/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct TreeNodeView: View {
  let treeNode: TreeNode
  
  @State var isSelected = false
  @State private var animationAmount: CGFloat = 1

  var body: some View {
    Text(String(treeNode.value))
      .frame(width: Constants.nodeRadius,
             height: Constants.nodeRadius,
             alignment: .center)
      .padding()
      .background(Circle()
                    .fill(Color.white))
      .padding(1)
      .background(Circle()
                    .stroke(
                      self.isSelected ? Color.red : Color.black,
                      lineWidth: 3
                    )
      )
  }
}

struct TreeNodeView_Previews: PreviewProvider {
  static var previews: some View {
    TreeNodeView(treeNode: TreeNode(value: 10))
  }
}
