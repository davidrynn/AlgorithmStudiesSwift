//
//  EdgeView.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/22/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct EdgeView: View {
  let start: CGPoint
  let end: CGPoint

    var body: some View {
      Path { path in
        path.move(to: start)
        path.addLine(to: end)
      }
      .stroke(Color.black, lineWidth: 2)
    }
}

struct Edge_Previews: PreviewProvider {

    static var previews: some View {
      EdgeView(start: CGPoint.zero, end: CGPoint(x: 200, y: 200))
    }
}
