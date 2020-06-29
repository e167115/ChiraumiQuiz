//
//  ImagesModel.swift
//  ChiraumiQuiz
//
//  Created by 高橋佑太 on 2020/06/12.
//  Copyright © 2020 高橋佑太. All rights reserved.
//

import Foundation


//画像名を取得して、その画像名がラウミかそうでは無いかを判定するための機能

class imagesModel{
    
    let imageText:String
    let answer:Bool
    
    init(imageName:String, correctOrNot:Bool) {
        
        imageText = imageName
        answer = correctOrNot
        
    }
    
    
    
}
