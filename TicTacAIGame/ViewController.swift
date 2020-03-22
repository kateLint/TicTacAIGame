//
//  ViewController.swift
//  TicTacAIGame
//
//  Created by Chukcha on 22/03/2020.
//  Copyright © 2020 Chukcha. All rights reserved.
//

import UIKit

//
//  ViewController.swift
//  TicTacToe(WithAI)
//
//  Created by Tanmay Bakshi on 2015-07-14.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//


class ViewController: UIViewController {

    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    
    @IBOutlet var resetbtn: UIButton!
    @IBOutlet var output: UILabel!
    
    var gameOver: Bool = false
    var plays: [Int: Int] = [:]
    var isForkingMove: Bool = false
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reset()
     //   timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector(("changeColors")), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeColors), userInfo: nil, repeats: false)
        
        
      //  changeColors()
    }
    
    @objc func changeColors() {
        
        button0.titleLabel!.textColor = plays[0] == 0 ? UIColor.red : (plays[0] == 1 ? UIColor.green : UIColor.black)
        button1.titleLabel!.textColor = plays[1] == 0 ? UIColor.red : (plays[1] == 1 ? UIColor.green : UIColor.black)
        button2.titleLabel!.textColor = plays[2] == 0 ? UIColor.red : (plays[2] == 1 ? UIColor.green : UIColor.black)
        button3.titleLabel!.textColor = plays[3] == 0 ? UIColor.red : (plays[3] == 1 ? UIColor.green : UIColor.black)
        button4.titleLabel!.textColor = plays[4] == 0 ? UIColor.red : (plays[4] == 1 ? UIColor.green : UIColor.black)
        button5.titleLabel!.textColor = plays[5] == 0 ? UIColor.red : (plays[5] == 1 ? UIColor.green : UIColor.black)
        button6.titleLabel!.textColor = plays[6] == 0 ? UIColor.red : (plays[6] == 1 ? UIColor.green : UIColor.black)
        button7.titleLabel!.textColor = plays[7] == 0 ? UIColor.red : (plays[7] == 1 ? UIColor.green : UIColor.black)
        button8.titleLabel!.textColor = plays[8] == 0 ? UIColor.red : (plays[8] == 1 ? UIColor.green : UIColor.black)
        
    }
    
    @IBAction func btnClicked(sender: UIButton) {
        if !gameOver {
            var gridToPlace = 0
            if sender == button0 { gridToPlace = 0 }
            if sender == button1 { gridToPlace = 1 }
            if sender == button2 { gridToPlace = 2 }
            if sender == button3 { gridToPlace = 3 }
            if sender == button4 { gridToPlace = 4 }
            if sender == button5 { gridToPlace = 5 }
            if sender == button6 { gridToPlace = 6 }
            if sender == button7 { gridToPlace = 7 }
            if sender == button8 { gridToPlace = 8 }
            
            plays[gridToPlace] = plays[gridToPlace] != 0 ? 1 : 0
            if plays[gridToPlace] == 1 {
                resetView()
                checkForWin()
                AIDoesTurn()
                resetView()
            }
        }
    }
    
    func checkForWin() {
        
        if
            (plays[0] == 1 && plays[1] == 1 && plays[2] == 1) ||
            (plays[3] == 1 && plays[4] == 1 && plays[5] == 1) ||
            (plays[6] == 1 && plays[7] == 1 && plays[8] == 1) ||
            (plays[0] == 1 && plays[3] == 1 && plays[6] == 1) ||
            (plays[1] == 1 && plays[4] == 1 && plays[7] == 1) ||
            (plays[2] == 1 && plays[5] == 1 && plays[8] == 1) ||
            (plays[0] == 1 && plays[4] == 1 && plays[8] == 1) ||
            (plays[2] == 1 && plays[4] == 1 && plays[6] == 1) &&
            !gameOver
        {
            gameOver = true
            resetbtn.isHidden = false
            output.isHidden = false
            output.text = "The user (X) won!"
            return
        }
        
        if
            (plays[0] == 0 && plays[1] == 0 && plays[2] == 0) ||
            (plays[3] == 0 && plays[4] == 0 && plays[5] == 0) ||
            (plays[6] == 0 && plays[7] == 0 && plays[8] == 0) ||
            (plays[0] == 0 && plays[3] == 0 && plays[6] == 0) ||
            (plays[1] == 0 && plays[4] == 0 && plays[7] == 0) ||
            (plays[2] == 0 && plays[5] == 0 && plays[8] == 0) ||
            (plays[0] == 0 && plays[4] == 0 && plays[8] == 0) ||
            (plays[2] == 0 && plays[4] == 0 && plays[6] == 0) &&
            !gameOver
        {
            gameOver = true
            resetbtn.isHidden = false
            output.isHidden = false
            output.text = "The computer (O) won!"
            return
        }
        
        if !plays.values.contains(-1) {
            gameOver = true
            resetbtn.isHidden = false
            output.isHidden = false
            output.text = "We are in a draw!"
        }
        
    }
    
    func resetView() {
        
        if !gameOver {
            button0.setTitle(plays[0] == 0 ? "o": (plays[0] == 1 ? "x" : button0.titleLabel!.text!), for: UIControl.State.normal)
            button1.setTitle(plays[1] == 0 ? "o": (plays[1] == 1 ? "x" : button1.titleLabel!.text!), for: UIControl.State.normal)
            button2.setTitle(plays[2] == 0 ? "o": (plays[2] == 1 ? "x" : button2.titleLabel!.text!), for: UIControl.State.normal)
            button3.setTitle(plays[3] == 0 ? "o": (plays[3] == 1 ? "x" : button3.titleLabel!.text!), for: UIControl.State.normal)
            button4.setTitle(plays[4] == 0 ? "o": (plays[4] == 1 ? "x" : button4.titleLabel!.text!), for: UIControl.State.normal)
            button5.setTitle(plays[5] == 0 ? "o": (plays[5] == 1 ? "x" : button5.titleLabel!.text!), for: UIControl.State.normal)
            button6.setTitle(plays[6] == 0 ? "o": (plays[6] == 1 ? "x" : button6.titleLabel!.text!), for: UIControl.State.normal)
            button7.setTitle(plays[7] == 0 ? "o": (plays[7] == 1 ? "x" : button7.titleLabel!.text!), for: UIControl.State.normal)
            button8.setTitle(plays[8] == 0 ? "o": (plays[8] == 1 ? "x" : button8.titleLabel!.text!), for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func resetClicked() {
        reset()
    }
    
    func reset() {
        for i in 0...8 {
            plays[i] = -1
        }
        button0.setTitle("_", for: UIControl.State.normal)
        button1.setTitle("_", for: UIControl.State.normal)
        button2.setTitle("_", for: UIControl.State.normal)
        button3.setTitle("_", for: UIControl.State.normal)
        button4.setTitle("_", for: UIControl.State.normal)
        button5.setTitle("_", for: UIControl.State.normal)
        button6.setTitle("_", for: UIControl.State.normal)
        button7.setTitle("_", for: UIControl.State.normal)
        button8.setTitle("_", for: UIControl.State.normal)
        gameOver = false
        resetbtn.isHidden = true
        output.isHidden = true
    }
    
    func AIDoesTurn() {
        var currentMove: Int!
        //NOTE: Play sides
        if plays[1] == -1 {
            currentMove = 1
        }
        if plays[3] == -1 {
            currentMove = 3
        }
        if plays[5] == -1 {
            currentMove = 5
        }
        if plays[7] == -1 {
            currentMove = 7
        }
        //NOTE: Play corners
        if plays[0] == -1 {
            currentMove = 0
        }
        if plays[2] == -1 {
            currentMove = 2
        }
        if plays[6] == -1 {
            currentMove = 6
        }
        if plays[8] == -1 {
            currentMove = 8
        }
        //NOTE: Play center
        if plays[4] == -1 {
            currentMove = 4
        }
        //NOTE: Block classic forks
        if plays[1] == 1 && plays[3] == 1 && plays[0] == -1 {
            currentMove = 0
        }
        if plays[3] == 1 && plays[7] == 1 && plays[6] == -1 {
            currentMove = 6
        }
        if plays[7] == 1 && plays[5] == 1 && plays[8] == -1 {
            currentMove = 8
        }
        if plays[5] == 1 && plays[1] == 1 && plays[2] == -1 {
            currentMove = 2
        }
        var tempCurrentMove = currentMove
        var tempPlays = plays
        tempPlays[8] = -1
        if isForkingMove {
            if plays[6] == 1 {
                currentMove = 4
            }
            isForkingMove = false
        }
        if plays[8] == 1 && !tempPlays.values.contains(1) && !tempPlays.values.contains(0) {
            isForkingMove = true
            currentMove = 7
        }
        //NOTE: Block the user if they can win
        if let winAvailable = twoInRow(player: "x", inArray: plays) {
            currentMove = winAvailable
        }
        //NOTE: Win if you can
        if let winAvailable = twoInRow(player: "o", inArray: plays) {
            currentMove = winAvailable
        }
        //NOTE: Play the move
        if let _ = currentMove {
            plays[currentMove] = 0
            resetView()
            checkForWin()
            resetView()
        }
    }
    
    func twoInRow(player: String, inArray: [Int: Int]) -> Int? {
        
        if player == "x" {
            //On top
            if inArray[0] == 1 && inArray[1] == 1 && inArray[2] == -1 {
                return 2
            }
            if inArray[0] == 1 && inArray[1] == -1 && inArray[2] == 1 {
                return 1
            }
            if inArray[0] == -1 && inArray[1] == 1 && inArray[2] == 1 {
                return 0
            }
            //Middle
            if inArray[3] == 1 && inArray[4] == 1 && inArray[5] == -1 {
                return 5
            }
            if inArray[3] == 1 && inArray[4] == -1 && inArray[5] == 1 {
                return 4
            }
            if inArray[3] == -1 && inArray[4] == 1 && inArray[5] == 1 {
                return 3
            }
            //Bottom
            if inArray[6] == 1 && inArray[7] == 1 && inArray[8] == -1 {
                return 8
            }
            if inArray[6] == 1 && inArray[7] == -1 && inArray[8] == 1 {
                return 7
            }
            if inArray[6] == -1 && inArray[7] == 1 && inArray[8] == 1 {
                return 6
            }
            //Left
            if inArray[0] == 1 && inArray[3] == 1 && inArray[6] == -1 {
                return 6
            }
            if inArray[0] == 1 && inArray[3] == -1 && inArray[6] == 1 {
                return 3
            }
            if inArray[0] == -1 && inArray[3] == 1 && inArray[6] == 1 {
                return 0
            }
            //Middle
            if inArray[1] == 1 && inArray[4] == 1 && inArray[7] == -1 {
                return 7
            }
            if inArray[1] == 1 && inArray[4] == -1 && inArray[7] == 1 {
                return 4
            }
            if inArray[1] == -1 && inArray[4] == 1 && inArray[7] == 1 {
                return 1
            }
            //Right
            if inArray[2] == 1 && inArray[5] == 1 && inArray[8] == -1 {
                return 8
            }
            if inArray[2] == 1 && inArray[5] == -1 && inArray[8] == 1 {
                return 5
            }
            if inArray[2] == -1 && inArray[5] == 1 && inArray[8] == 1 {
                return 2
            }
        } else {
            //On top
            if inArray[0] == 0 && inArray[1] == 0 && inArray[2] == -1 {
                return 2
            }
            if inArray[0] == 0 && inArray[1] == -1 && inArray[2] == 0 {
                return 1
            }
            if inArray[0] == -1 && inArray[1] == 0 && inArray[2] == 0 {
                return 0
            }
            //Middle
            if inArray[3] == 0 && inArray[4] == 0 && inArray[5] == -1 {
                return 5
            }
            if inArray[3] == 0 && inArray[4] == -1 && inArray[5] == 0 {
                return 4
            }
            if inArray[3] == -1 && inArray[4] == 0 && inArray[5] == 0 {
                return 3
            }
            //Bottom
            if inArray[6] == 0 && inArray[7] == 0 && inArray[8] == -1 {
                return 8
            }
            if inArray[6] == 0 && inArray[7] == -1 && inArray[8] == 0 {
                return 7
            }
            if inArray[6] == -1 && inArray[7] == 0 && inArray[8] == 0 {
                return 6
            }
            //Left
            if inArray[0] == 0 && inArray[3] == 0 && inArray[6] == -1 {
                return 6
            }
            if inArray[0] == 0 && inArray[3] == -1 && inArray[6] == 0 {
                return 3
            }
            if inArray[0] == -1 && inArray[3] == 0 && inArray[6] == 0 {
                return 0
            }
            //Middle
            if inArray[1] == 0 && inArray[4] == 0 && inArray[7] == -1 {
                return 7
            }
            if inArray[1] == 0 && inArray[4] == -1 && inArray[7] == 0 {
                return 4
            }
            if inArray[1] == -1 && inArray[4] == 0 && inArray[7] == 0 {
                return 1
            }
            //Right
            if inArray[2] == 0 && inArray[5] == 0 && inArray[8] == -1 {
                return 8
            }
            if inArray[2] == 0 && inArray[5] == -1 && inArray[8] == 0 {
                return 5
            }
            if inArray[2] == -1 && inArray[5] == 0 && inArray[8] == 0 {
                return 2
            }
        }
        
        return nil
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



