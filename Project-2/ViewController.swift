//
//  ViewController.swift
//  Project-2
//
//  Created by Emir Alkal on 1.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        print(countries.count)
        askQuestion()
    }

    func askQuestion() {
        currentQuestion += 1
        print(currentQuestion)
        
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    
        title = "\(countries[correctAnswer].uppercased())        Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if currentQuestion == countries.count {
            let ac = UIAlertController(title: "Game Done", message: "Your final score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: { action in
                self.currentQuestion = 0
                self.score = 0
                self.askQuestion()
            }))
            
            present(ac, animated: true)
        }
        
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, True answer is \(countries[correctAnswer])"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default))
        present(ac, animated: true)
        askQuestion()
        
    }
    
}

