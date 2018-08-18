//
//  AboutUsViewController.swift
//  AimForThatTest
//
//  Created by Jose Saracho on 8/15/18.
//  Copyright © 2018 JosApp. All rights reserved.
//

import UIKit
import WebKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // metodo para llamar a una web interna dentro de la app
        
       /* if let url = Bundle.main.url(forResource: "index", withExtension: "html"){
            
            let myURL = URL(string: "\(url)")
            
            let myRequest = URLRequest(url: myURL!)
            
            webView.load(myRequest)
            
            
        }*/
        
        //web externa
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
