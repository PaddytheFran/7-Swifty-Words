//
//  ViewController.swift
//  HackingWithSwift - Project8
//
//  Created by Patrick Flanagan on 12/21/17.
//  Copyright © 2017 Patrick Flanagan. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		for subview in view.subviews where subview.tag == 1001 {
			
			let btn = subview as! UIButton
			letterButtons.append(btn)
			btn.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
			
		}
		
		loadLevel()
		
    }
	
	@objc func letterTapped(btn: UIButton) {
		
		currentAnswer.text = currentAnswer.text! + btn.titleLabel!.text!
		activatedButtons.append(btn)
		btn.isHidden = true
		
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
		
		if let solutionPosition = solutions.index(of: currentAnswer.text!) {
			activatedButtons.removeAll()
			
			var splitAnswers = answersLabel.text!.components(separatedBy: "\n")
			splitAnswers[solutionPosition] = currentAnswer.text!
			answersLabel.text = splitAnswers.joined(separator: "\n")
			
			currentAnswer.text = ""
			score += 1
			
			if score % 7 == 0 {
				let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
				ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
				present(ac, animated: true)
			}
		}
	
	}
    
    @IBAction func clearTapped(_ sender: UIButton) {
		
		currentAnswer.text = ""
		
		for btn in activatedButtons {
			btn.isHidden = false
		}
		
		activatedButtons.removeAll()
		
	}
    
	var letterButtons = [UIButton]()
	var activatedButtons = [UIButton]()
	var solutions = [String]()
	
	var score = 0 {
		didSet {
			scoreLabel.text =
			"Score:\(score)"
		}
	}
	
	var level = 1
	
	func loadLevel() {
		var clueString = ""
		var solutionString = ""
		var letterBits = [String]()
		
		if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: "txt"){
			if let levelContents = try? String(contentsOfFile: levelFilePath) {
				var lines = levelContents.components(separatedBy: "\n")
				lines = GKRandomSource().arrayByShufflingObjects(in: lines) as! [String]
				for (index, line) in lines.enumerated() {
					let parts = line.components(separatedBy: ": ")
					let answer = parts[0]
					let clue = parts[1]
					
					clueString += "\(index + 1). \(clue)\n"
					
					let solutionWord = answer.replacingOccurrences(of: "|", with: "")
					solutionString += "\(solutionWord.count) letters\n"
					solutions.append(solutionWord)
					
					let bits = answer.components(separatedBy: "|")
					letterBits += bits
					
				}
			}
		}
		
		cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
		answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
		
		letterBits = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: letterBits) as! [String]
		
		if letterBits.count == letterButtons.count {
			for i in 0 ..< letterBits.count {
				letterButtons[i].setTitle(letterBits[i], for: .normal)
				
			}
		}
		
		
	}
	
	func levelUp(action: UIAlertAction) {
		level += 1
		solutions.removeAll(keepingCapacity: true)
		
		loadLevel()
		
		for btn in letterButtons {
			btn.isHidden = false
		}
	}
	
    
}

