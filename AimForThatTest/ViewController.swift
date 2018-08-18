//
//  ViewController.swift
//  AimForThatTest
//
//  Created by Jose Saracho on 8/1/18.
//  Copyright © 2018 JosApp. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue : Int = 0
    var targetValue  : Int = 0
    var score        : Int = 0
    var round        : Int = 0
    var time         : Int = 0
    var timer        : Timer?
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupSlider()
        reset()
        updateLabels()
    }
    
    func setupSlider()
    {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trakRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        
        
        self.slider.setThumbImage(thumbImageNormal, for: .normal)
        self.slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightResizable = trakRightImage.resizableImage(withCapInsets: insets)
        
        self.slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        self.slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let diffence : Int = abs(self.currentValue - self.targetValue)
        
        var points : Int = (diffence > 0) ? 100 - diffence : 1000 //ternario.. si es diferencia es mayor a 0 .. 100 - diff... sino  1000 puntos
        
        self.score += points
        
        
        let title : String
        
        switch diffence {
        case 0:
            title = "Puntacion perfecta!!!"
        case 1...5 :
            title = "Casi perfecto"
            points = Int(Float(points) * 1.5)
        case 6...12:
            title = "Te ha faltado poco"
            points = Int(Float(points)  * 1.1)
        default:
            title = "Estas lejos"
        }
        
        let message = "Has marcado \(points) puntos!!! "
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        
        let action = UIAlertAction(title: "OK!", style: .destructive, handler: {
            action in
            self.newRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        
        self.currentValue = Int(sender.value)
        
        print("el valor del slider es \(self.currentValue)")
    }
    
    func newRound() {
        self.targetValue = 1 + Int(arc4random_uniform(100)) //genera los valores aleatorios entre 1 y 100
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.round += 1
    }
    
    func updateLabels () {
        self.targetLabel.text = "\(self.targetValue)"
        self.scoreLabel.text = "\(self.score)"
        self.roundLabel.text = "\(self.round)"
        self.timeLabel.text = "\(self.time)"
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        self.reset()
        self.updateLabels()
        
        let transition = CATransition()
        
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        self.view.layer.add(transition, forKey: nil)
        
    }
    
    func reset() {
        self.score = 0
        self.round = 0
        self.time = 60
        
        if timer != nil {
            timer?.invalidate()
        }
        
       // timer = Timer(timeInterval: 1, target: self, selector: #selector(tic), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tic), userInfo: nil, repeats: true)
        
        self.newRound()
    }
    
    @objc func tic() {
        self.time -= 1
        self.timeLabel.text = "\(self.time)"
        
        if self.time <= 0 {
            self.reset()
        }
    }
}

