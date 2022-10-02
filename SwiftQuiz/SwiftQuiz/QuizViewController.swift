//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by DS Mac Mini on 02/10/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var viewTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    var quizManager: QuizManager!
       

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //toda vez que uma tela vai aparecer essa função é chamada
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        quizManager = QuizManager()
        
        viewTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear) {
            self.viewTimer.frame.size.width = 0
        } completion: { sucess in
            self.showResults()
        }
        
        getNewQuiz()
        
    }
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
        
        
    }
    
    func showResults () {
      performSegue(withIdentifier: "resultSegue", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as!
        ResultViewController
        
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrecAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswers(_ sender: UIButton) {
        let index = btAnswers.firstIndex(of: sender)!
        quizManager.validateAnswers(index: index)
        getNewQuiz()
        
    }
    

}
