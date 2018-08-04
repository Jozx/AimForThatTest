//
//  ViewController.swift
//  AimForThatTest
//
//  Created by Jose Saracho on 8/1/18.
//  Copyright © 2018 JosApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int = 0
    var targetValue  : Int = 0
    var score        : Int = 0
    var round        : Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let diffence : Int = abs(self.currentValue - self.targetValue)
        
        let points : Int = (diffence > 0) ? 100 - diffence : 1000 //ternario.. si es diferencia es mayor a 0 .. 100 - diff... sino  1000 puntos
        
        self.score += points
        
        let message = """
            Has marcado \(points) puntos!!!
        """
        
        
        
        let alert = UIAlertController(title: "Hola Mundo", message: message, preferredStyle: .alert)

        
        let action = UIAlertAction(title: "Cerrar", style: .destructive, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        newRound()
        updateLabels()
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
    }
}

