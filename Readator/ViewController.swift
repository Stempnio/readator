//
//  ViewController.swift
//  revision1
//
//  Created by Jakub Stepien on 25/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var readingTime: Float = 200
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let numberOfWords = InputTextFieldOutlet.text?.components(separatedBy: .whitespacesAndNewlines).count ?? 0
        let seconds = numberOfWords / Int(readingTime / 60)
        let (h,m,s) = secondsToHoursMinutesSeconds(seconds)
        estimatedTimeLabel.text = "\(h) hours \(m) minutes \(s) seconds"
    }
    
    @IBOutlet var ReadingSpeedLabelOutlet: UILabel!
    @IBOutlet var estimatedTimeLabel: UILabel!
    @IBOutlet var InputTextFieldOutlet: UITextField!
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        readingTime = sender.value
        ReadingSpeedLabelOutlet.text = String(readingTime) + " wpm"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InputTextFieldOutlet.delegate = self
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
