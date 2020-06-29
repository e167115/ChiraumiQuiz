//
//  ViewController.swift
//  ChiraumiQuiz
//
//  Created by 高橋佑太 on 2020/06/11.
//  Copyright © 2020 高橋佑太. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NowScoreDelegate {
    
    

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    
    var correctCount = 0
    
    var wrongCount = 0
    
    var maxScore = 0
    
    var questionNumber = 0
    
    let imagesList = ImagesList()
    
    var soundFile = SoundFile()
    
//IBActionで拾ってきた回答がどちらなのか取得する
    var pickedAnswer = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageView.layer.cornerRadius = 20.0
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
            
            
        }else{
            
        }
        
        maxScoreLabel.text = String(maxScore)
        
    }
    
    
    
    @IBAction func answerAction(_ sender: Any) {
    
    
        if (sender as AnyObject).tag == 1{
//            丸ボタンが押された時
            pickedAnswer = true
            
            soundFile.playSound(fileName: "maruSound", extentionNAme: "mp3")
            
            
        }else if (sender as AnyObject).tag == 2{
            
//            バツボタンが押された時
            pickedAnswer = false
            soundFile.playSound(fileName: "batsuSound", extentionNAme: "mp3")
            
            
            
        }
        
        check()
        nextQuestion()
    
    
    }
    
    func check(){
        
        let correctAnswer = imagesList.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer{
            
            print("正解")
            correctCount = correctCount + 1
            
        }else{
            
            print("間違い")
            wrongCount = wrongCount + 1
        }
        
    }
    
    func nextQuestion(){
        
        if questionNumber <= 3{
            
            questionNumber = questionNumber + 1
            
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
            
        }else{
            
            print("問題終了")
//            問題終了→画面遷移
            performSegue(withIdentifier: "next", sender: nil)
   
        }
        
    }
    
    
    func nowScore(Score: Int) {
        
        soundFile.playSound(fileName: "sound", extentionNAme: "mp3")
        maxScoreLabel.text = String(Score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            nextVC.wrongedCount = wrongCount
            nextVC.delegate = self
        }
        
    }
    
}

