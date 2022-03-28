//
//  SpeedTestViewController.swift
//  revision1
//
//  Created by Jakub Stepien on 26/03/2022.
//

import UIKit

class SpeedTestViewController: UIViewController {

    var start = Date()
    var end = Date()
    var elapsedTime: Int {
        let secondsStart = Calendar.current.component(.second, from:start)
        let secondsEnd = Calendar.current.component(.second, from: end)
        return secondsEnd - secondsStart
    }
    
    @IBOutlet var endButton: UIButton!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var elapsedTimeLabel: UILabel!
    @IBOutlet var readingSpeedLabel: UILabel!
    @IBOutlet var textView: UILabel!
    
    @IBAction func startMeasuringTime(_ sender: Any) {
        start = Date()
        startButton.isEnabled = false
        endButton.isEnabled = true
        elapsedTimeLabel.text = "Click stop to finish"
    }
    
    @IBAction func stopMeasuringTime(_ sender: UIButton) {
        end = Date()
        endButton.isEnabled = false
        startButton.isEnabled = true
        elapsedTimeLabel.text = String(elapsedTime) + " seconds"
        readingSpeedLabel.text = String(calculateReadingSpeed(seconds: elapsedTime)) + " wpm"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endButton.isEnabled = false
    }
    
    func calculateReadingSpeed(seconds: Int) -> Int {
        let minutes = Double(seconds)/60
        
        guard minutes > 0.001 else {
            return 0
        }
        
        let numberOfWords = textView.text?.components(separatedBy: .whitespacesAndNewlines).count
        
        return Int(Double(numberOfWords!)/Double(minutes))
    }
    

}
