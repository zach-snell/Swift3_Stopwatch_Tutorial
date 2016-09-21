//
//  ViewController.swift
//  Stopwatch
//
//  Created by Zachary Snell on 8/21/16.
//  Copyright © 2016 Zachary Snell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var currentTime = 0
    
    @IBOutlet weak var stopWatchDisplay: UILabel!
    @IBOutlet weak var stopWatchToggleButton: UIButton!
    
    @IBAction func stopWatchToggleTouchUpInside(_ sender: AnyObject) {
        if timer != nil {
            stopWatchToggleButton.setTitle("Start", for: .normal)
            timer?.invalidate()
            timer = nil
        } else {
            stopWatchToggleButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.currentTime += 1
                let minutesPortion = String(format: "%02d", self.currentTime / 60 )
                let secondsPortion = String(format: "%02d", self.currentTime % 60 )
                self.stopWatchDisplay.text = "\(minutesPortion):\(secondsPortion)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

