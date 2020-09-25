//
//  TreeNodeView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/23/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct TreeNodeView: View {
  let value: Int
  var body: some View {
    Text(String(value))
      .frame(width: Constants.nodeRadius,
             height: Constants.nodeRadius,
             alignment: .center)
      .padding()
      .background(Circle()
                    .fill(Color.white))
      .padding(1)
      .background(Circle()
                    .stroke(Color.black, lineWidth: 2))
  }
}

struct TreeNodeView_Previews: PreviewProvider {
  static var previews: some View {
    TreeNodeView(value: 10)
  }
}
