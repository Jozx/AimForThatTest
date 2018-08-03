//
//  ViewController.swift
//  AimForThatTest
//
//  Created by Jose Saracho on 8/1/18.
//  Copyright © 2018 JosApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hola Mundo", message: "Este es el juego Aim For That", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cerrar", style: .destructive, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

