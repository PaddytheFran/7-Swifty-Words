//
//  ViewController.swift
//  HackingWithSwift - Project8
//
//  Created by Patrick Flanagan on 12/21/17.
//  Copyright © 2017 Patrick Flanagan. All rights reserved.
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

    @IBOutlet weak var cluesLabel: UILabel!
    
    @IBOutlet weak var answersLabel: UILabel!
    
    @IBOutlet weak var currentAnswer: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func submitTapped(_ sender: UIButton) {
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
    }
    
    
    
}

