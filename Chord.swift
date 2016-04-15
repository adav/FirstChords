//
//  Chord.swift
//  FirstChords
//
//  Created by Davidson, Andrew (ELS) on 15/04/2016.
//  Copyright © 2016 Davidson, Andrew (ELS). All rights reserved.
//

import Foundation

/*
"index": 0,
"time": 0.11335600912570953,
"chord": "N"
*/

class Chord {
    let originalIndex: Int
    let timeInSong: Double
    let durationUntilNextChord: Double
    let chord: String
    
    init(index: Int, time: Double, duration: Double, chord: String) {
        self.originalIndex = index
        self.timeInSong = time
        self.durationUntilNextChord = duration
        self.chord = chord
    }
    
    
}