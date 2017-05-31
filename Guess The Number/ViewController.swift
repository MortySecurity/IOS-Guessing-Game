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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        guessNumber = Int(arc4random_uniform(100)+1);
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func restartButton(_ sender: Any) {
       
        guessNumber = Int(arc4random_uniform(100)+1);
        
        
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
                dismissKeyboard();
                guessAgain = true;
            } else if num! < guessNumber{
                guessLabel.text = "Too small";
                
            } else if num! > guessNumber{
                guessLabel.text = "Too big";
                
            }
            
            guessText.text = "";
            
        } else {
            guessLabel.text = "Please enter a number. (1-100)"
        }
    }
    
}

