//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by DS Mac Mini on 02/10/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lbAnswers: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    
    var totalCorrecAnswers: Int = 0
    var totalAnswers: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnswers.text = "Perguntas respondidas : \(totalAnswers)"
        lbCorrect.text = "Perguntas corretas : \(totalCorrecAnswers)"
        lbWrong.text = "Perguntas erradas  : \(totalAnswers - totalCorrecAnswers)"
        
        let score = totalCorrecAnswers * 100 / totalAnswers
        lbScore.text = "\(score)%"
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
