//
//  ChordsInterfaceController.swift
//  FirstChords
//
//  Created by Davidson, Andrew (ELS) on 15/04/2016.
//  Copyright © 2016 Davidson, Andrew (ELS). All rights reserved.
//

import WatchKit
import Foundation


class ChordsInterfaceController: WKInterfaceController {

    @IBOutlet var countdownLabel: WKInterfaceLabel!
    @IBOutlet var startButton: WKInterfaceButton!
    
    var countdown: Int = 5
    var timer = NSTimer()
    
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
    @IBAction func buttonPressed() {
        if(!timer.valid){
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerAction", userInfo: nil, repeats: true)
            timerAction()
            startButton.setTitle("Stop")
        } else {
            resetTimer()
        }
    }
    
    func resetTimer() {
        timer.invalidate()
        countdown = 5
        startButton.setTitle("Start")
        
    }
    
    func timerAction() {
        countdownLabel.setText(String(countdown))
        if (countdown-- < 1){
            resetTimer()
        }
    }
    
    func tapWrist(){
        WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Start)
    }
}
