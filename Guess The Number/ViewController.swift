//
//  ViewController.swift
//  Guess The Number
//
//  Created by Mourtadah karim on 2017-05-30.
//  Copyright © 2017 Mourtadah karim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guessText: UITextField!
    
    
    @IBOutlet weak var guessLabel: UILabel!
    
    private var guessNumber = 0;
    private var countGuess = 0;
    
    private var guessAgain = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessNumber = Int(arc4random_uniform(100)+1);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func guessTheNumber(_ sender: Any) {
        
        if guessAgain{
            countGuess = 0;
            guessText.text = "";
            guessNumber = Int(arc4random_uniform(100)+1);
            guessAgain = false;
        }
        
        if Int(guessText.text!) != nil{
            
            let num = Int(guessText.text!);
            countGuess += 1;
            
            if num == guessNumber{
                guessLabel.text = "You guessed the correct number, (\(guessNumber)), it took you (\(countGuess)) guessses. Play again?";
                guessAgain = true;
            } else if num! < guessNumber{
                guessLabel.text = "Your number is less than the mystery number";
            } else if num! > guessNumber{
                guessLabel.text = "Your number is bigger than the mystery number";
            }
            
            guessText.text = "";
            
        } else {
            guessLabel.text = "Please enter a number."
        }
    }
    
}
