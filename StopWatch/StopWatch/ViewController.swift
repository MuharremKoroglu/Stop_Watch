//
//  ViewController.swift
//  StopWatch
//
//  Created by Muharrem Köroğlu on 24.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var count = 25
    var pause = true
    var start = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func countDown () {
        count -= 1
        timerLabel.text = "\(count)"
        if count <= 0 {
            timerLabel.text = "\(count)"
            timer.invalidate()
        }
    }

    
    @IBAction func startButton(_ sender: Any) {
        if start == true {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            start = false
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        if pause == true && count != 25{
            timer.invalidate()
            pause = false
        }else if pause == false && count != 0{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            pause = true
        }
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        timer.invalidate()
        count = 25
        timerLabel.text = "\(count)"
        start = true
    }
     
}

