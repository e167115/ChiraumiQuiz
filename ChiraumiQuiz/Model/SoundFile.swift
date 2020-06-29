//
//  SoundFile.swift
//  ChiraumiQuiz
//
//  Created by 高橋佑太 on 2020/06/12.
//  Copyright © 2020 高橋佑太. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String, extentionNAme:String){
        
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionNAme)
        
        do {
        
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        } catch  {
            print("エラーです")
        }
        
    }
    
}
