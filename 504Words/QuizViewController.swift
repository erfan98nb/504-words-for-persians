//
//  QuizViewController.swift
//  504Words
//
//  Created by MAC os on 3/6/21.
//

import UIKit
struct Question {
    var question: String
    var answers:[String]!
    var answer : Int?
    
}
class QuizViewController: UIViewController {
    @IBOutlet var ButtnosOL: [UIButton]!
    
    var Questions = [Question]()
    var Qnumber = Int()
    var answerNumbres = Int()
    
    @IBOutlet weak var Word: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Word.layer.masksToBounds = true
        Word.layer.cornerRadius = 100
        Questions = [Question(question: "abandon", answers: ["left","live","leave"], answer: 0),Question(question: "unaccustomed", answers: ["family","unadopted","stable"], answer: 2),Question(question: "scarce", answers: ["rare","mind","invent"], answer: 1),Question(question: "devise", answers: ["light","simple","invent"], answer: 0),Question(question: "conceal", answers: ["track","live","hide"], answer: 0),Question(question: "frigid", answers: ["freezing","secret","waterfal"], answer: 1),Question(question: "gallant", answers: ["heroic","gloom","result"], answer: 1),Question(question: "dense", answers: ["move","think","thick"], answer: 0)
        ]
        
        pickQuestion()
        setGradientBackground()
     }
    
//
    func setGradientBackground() {
        let colorTop =  UIColor(red: 151/255.0, green: 150/255.0, blue: 240/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 251/255.0, green: 199/255.0, blue: 212/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
       self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func pickQuestion(){
 
        if Questions.count > 0{
            Qnumber = 0
            Word.text = Questions[Qnumber].question
            answerNumbres = Questions[Qnumber].answer!
            for i in 0..<ButtnosOL.count {
                ButtnosOL[i].setTitle(Questions[Qnumber].answers[i], for: .normal)
                ButtnosOL[i].layer.masksToBounds = true

                ButtnosOL[i].layer.cornerRadius = 15
            }
            Questions.remove(at: Qnumber)
            
        }
    }
    
    @IBAction func Btn1(_ sender: Any) {
        if answerNumbres == 0{
        
               
            pickQuestion()
 
        }else{
         }
    }
    
    @IBAction func Btn2(_ sender: Any) {
        if answerNumbres == 1{
            pickQuestion()
 
        }else{
         }
    }
    @IBAction func Btn3(_ sender: Any) {
        if answerNumbres == 2{
            pickQuestion()
         }else{
         }
    }
    
    
    
}
