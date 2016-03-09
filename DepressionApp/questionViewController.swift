//
//  questionViewController.swift
//  DepressionApp
//
//  Created by Matthew Dee on 09/03/2016.
//  Copyright © 2016 Matthew Dee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class QuestionViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    var Questions = [["q1","a1","a2","a3","a4"],["q2","a5","a6","a7","a8"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question()
    }
    func question(){
        var xpos = 0
        var ypos = 0
        for var x = xpos; x <= xpos;x++
        {
            for var y = ypos; y <= ypos; y++ {
                
                questionLabel.text = Questions[x][0];
                button1.setTitle(Questions[x][1], forState: .Normal)
                button2.setTitle(Questions[x][2], forState: .Normal)
                button3.setTitle(Questions[x][3], forState: .Normal)
                button4.setTitle(Questions[x][4], forState: .Normal)
            }
            
        }

    }

}
