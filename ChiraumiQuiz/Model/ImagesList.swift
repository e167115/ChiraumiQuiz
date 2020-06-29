//
//  ImagesList.swift
//  ChiraumiQuiz
//
//  Created by 高橋佑太 on 2020/06/12.
//  Copyright © 2020 高橋佑太. All rights reserved.
//

import Foundation

class ImagesList{
    
    
    var list = [imagesModel]()
    
    init() {
        
        list.append(imagesModel.init(imageName: "Obasan1", correctOrNot: false))
        list.append(imagesModel.init(imageName: "Obasan2", correctOrNot: false))
        list.append(imagesModel.init(imageName: "Chiemi1", correctOrNot: true))
        list.append(imagesModel.init(imageName: "Chiemi2", correctOrNot: true))
        list.append(imagesModel.init(imageName: "Chiemi3", correctOrNot: true))

    }
    
    
    
    
}
