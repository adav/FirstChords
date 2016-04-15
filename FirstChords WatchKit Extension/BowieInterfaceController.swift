//
//  BowieInterfaceController.swift
//  FirstChords
//
//  Created by Davidson, Andrew (ELS) on 15/04/2016.
//  Copyright © 2016 Davidson, Andrew (ELS). All rights reserved.
//

import WatchKit
import Foundation


class BowieInterfaceController: WKInterfaceController {

    var songChords: [Chord] = []
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func go() {
        let chords = parseBowieChords()
        songChords = processChordTimings(chords)
        
        songChords.forEach {c in
            print(c.chord + " " + c.durationUntilNextChord)
        }

    }
    
    func testList() {
        let poo = ["poom", "poon"]
        
        for(index, value) in poo.enumerate() {
            print(value)
            print(index)
        }
    }
    
    func parseBowieChords() -> [Chord] {
        var chordsList = [Chord]()
        
        do {
            let filePath = NSBundle.mainBundle().pathForResource("chordsForBowie", ofType: "json")
            let file = NSFileManager.defaultManager().contentsAtPath(filePath!)
            let json = try NSJSONSerialization.JSONObjectWithData(file!, options: .AllowFragments)
            
            if let chordsResult = json["chords_result"] as? [String: AnyObject] {
                if let chords = chordsResult["chords"] as? [[String: AnyObject]] {
                    for c in chords {
                        
                        
                        chordsList.append(
                            Chord(
                                index: Int(c["index"]! as! NSNumber),
                                time: Double(c["time"]! as! NSNumber),
                                duration: 0.0,
                                chord: c["chord"]! as! String
                        ))
                    }
                }
                
            }
        } catch {
            print("borked")
        }
        
        chordsList.forEach {c in print(c.chord)}
        
        return chordsList
    }
    
    func processChordTimings(chords: [Chord]) -> [Chord] {
        var newChords = chords
        for(index, c) in chords.enumerate() {
            
            if index + 1 < chords.count {
                let nextChord = chords[index + 1]
                newChords[index] = Chord(index: c.originalIndex, time: c.timeInSong, duration: nextChord.timeInSong - c.timeInSong, chord: c.chord)
            }
        }
        return newChords
    }

}
