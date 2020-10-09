//
//  TestView2.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 9/25/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

import SwiftUI

struct TestView2: View {
  @State var shouldTurn: Bool = false
    var body: some View {
      VStack {
        Text("Hello 1")
          .opacity(shouldTurn ? 1 : 0)
          .animation(Animation.easeOut(duration: 1)
                      .delay(1))
          Text("Hello2")
          .animation(Animation.easeOut(duration: 1).delay(2))

            Text("Hello2")
          .animation(Animation.easeOut(duration: 1).delay(3))
      }
      .onAppear {
        shouldTurn = true
      }
    }
}

//struct TestView2_Previews: PreviewProvider {
//    static var previews: some View {
//      TestView2()
//    }
//}
