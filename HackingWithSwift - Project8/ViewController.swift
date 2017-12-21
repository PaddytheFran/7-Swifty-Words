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
		
		for subview in view.subviews where subview.tag == 1001 {
			
			let btn = subview as! UIButton
			letterButtons.append(btn)
			btn.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
			
		}
		
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
    
	var letterButtons = [UIButton]()
	var activatedButtons = [UIButton]()
	var solutions = [String]()
	
	var score = 0
	var level = 1
	
	
	
    
}

