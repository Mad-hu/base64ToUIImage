//
//  ViewController.swift
//  base64ToUIImage
//
//  Created by yandonghu on 16/5/17.
//  Copyright © 2016年 Mad-hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///base64String transformation UIImage
        let base64String = ""
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imgView.image = base64StringToUIImage(base64String)
        self.view.addSubview(imgView)
        
        
        ///UIImage transformation base64String
        let img = UIImage()
        let base64StringForImg = imageToBase64String(img)
        print(base64StringForImg)
        
        
    }


}

