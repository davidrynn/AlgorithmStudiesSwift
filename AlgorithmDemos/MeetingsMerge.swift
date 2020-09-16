//
//  MeetingsMerge.swift
//  AlgorithmDemos
//
//  Created by David Rynn on 6/29/20.
//  Copyright © 2020 David Rynn. All rights reserved.
//

  class Meeting: CustomStringConvertible {

    var startTime: Int
    var endTime: Int

    init(startTime: Int, endTime: Int) {

        // number of 30 min blocks past 9:00 am
        self.startTime = startTime
        self.endTime = endTime
    }

    var description: String {
        return "(\(startTime), \(endTime))"
    }
}
