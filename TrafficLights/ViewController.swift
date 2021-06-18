//
//  ViewController.swift
//  TrafficLights
//
//  Created by Apple on 17/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var stopLight: UIButton!
    @IBOutlet weak var setTimer: UIButton!
    @IBOutlet weak var redNum: UITextField!
    @IBOutlet var yellowNum: UITextField!
    @IBOutlet weak var greenNum: UITextField!
    @IBOutlet weak var timeRed: UILabel!
    @IBOutlet weak var timeYellow: UILabel!
    @IBOutlet weak var timeGreen: UILabel!
    
    var timer: Timer!
    var red = 0
    var yellow = 0
    var green = 0
    var sumTime = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        redLight.backgroundColor = UIColor.white
        redLight.layer.cornerRadius = 35
        
        yellowLight.backgroundColor = UIColor.white
        yellowLight.layer.cornerRadius = 35
        
        greenLight.backgroundColor = UIColor.white
        greenLight.layer.cornerRadius = 35
        
        redNum.textAlignment = .center
        redNum.backgroundColor = .red
        redNum.placeholder = "Nhập số"
        redNum.keyboardType = UIKeyboardType.numberPad
        
        yellowNum.textAlignment = .center
        yellowNum.backgroundColor = .yellow
        yellowNum.placeholder = "Nhập số"
        yellowNum.keyboardType = UIKeyboardType.numberPad
        
        greenNum.textAlignment = .center
        greenNum.backgroundColor = .green
        greenNum.placeholder = "Nhập số"
        greenNum.keyboardType = UIKeyboardType.numberPad
        
        stopLight.backgroundColor = .white
        stopLight.setTitle("STOP", for: .normal)
        
        setTimer.backgroundColor = .white
        setTimer.setTitle("SET", for: .normal)
        
        timeRed.text = String("")
        timeRed.textAlignment = .center
        timeYellow.text = String("")
        timeYellow.textAlignment = .center
        timeGreen.text = String("")
        timeGreen.textAlignment = .center
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func setTimer(_ sender: UIButton) {
        guard let secondsRed = redNum.text,let secondsYellow = yellowNum.text, let secondsGreen = greenNum.text else {
            return
        }
        
        red = Int(secondsRed) ?? 0
        yellow = Int(secondsYellow) ?? 0
        green = Int(secondsGreen) ?? 0
        sumTime = red + green + yellow
        
    }
    
    @objc func runLoop() {
        if sumTime > 0 && red > 0 {
            timeGreen.text = String("")
            redLight.backgroundColor = .red
            yellowLight.backgroundColor = .white
            greenLight.backgroundColor = .white
            red -= 1
            timeRed.text = String(red)
        }
        
        if sumTime > 0 && red == 0 && yellow > 0 {
            timeRed.text = String(red)
            redLight.backgroundColor = .white
            yellowLight.backgroundColor = .yellow
            greenLight.backgroundColor = .white
            yellow -= 1
            timeYellow.text = String(yellow)
            timeRed.text = String("")
        }
        
        if sumTime > 0 && yellow == 0 && green > 0 {
            timeYellow.text = String("")
            redLight.backgroundColor = .white
            yellowLight.backgroundColor = .white
            greenLight.backgroundColor = .green
            green -= 1
            timeGreen.text = String(green)
        }
        
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
//        redLight.backgroundColor = .white
//        yellowLight.backgroundColor = .white
//        greenLight.backgroundColor = .white
//        sumTime = red + yellow + green
//        timer.invalidat()
    }
    
}

