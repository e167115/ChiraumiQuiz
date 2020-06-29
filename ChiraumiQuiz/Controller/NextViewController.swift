//
//  NextViewController.swift
//  ChiraumiQuiz
//
//  Created by 高橋佑太 on 2020/06/12.
//  Copyright © 2020 高橋佑太. All rights reserved.
//

import UIKit


protocol NowScoreDelegate {
    
    func nowScore(Score:Int)
    
}

class NextViewController: UIViewController {

    
    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var wrongLabel: UILabel!
    
    
    var correctedCount = 0
    var wrongedCount = 0
    
    var beforeCount = 0
    
    var delegate:NowScoreDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongedCount)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
        
    }
    

    
    
    @IBAction func back(_ sender: Any) {
    
        if beforeCount < correctedCount{
            
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            
            delegate?.nowScore(Score: correctedCount)
            
            
            
        }else if beforeCount > correctedCount{
            
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        
        
        
    dismiss(animated: true, completion: nil)
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
