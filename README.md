# base64ToUIImage
Tools use base64String to UIImage and UIImage to base64String,swift 3.0


        ///UIImage transformation base64String
        let img = UIImage(named:"circle")
        let base64StringForImg = imageToBase64String(img!)
        print(base64StringForImg)
        
        
        ///base64String transformation UIImage
        let base64String = base64StringForImg
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imgView.image = base64StringToUIImage(base64String!)
        self.view.addSubview(imgView)
        
        ///add extensions : String , UIImage  choose a way you like
        let imgBase64String = "circle".getImageConvertedToBase64String()  //string extension
        let imgView2 = UIImageView(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
        imgView2.image = imgBase64String?.base64StringToUIImage()         //string extension
        self.view.addSubview(imgView2)
        
        let uiImageToBase64String = UIImage(named:"circle")?.getBase64String() //UIImage extension
