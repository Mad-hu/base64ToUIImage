# base64ToUIImage
Tools use base64String to UIImage and UIImage to base64String,swift 2.2


        ///base64String transformation UIImage
        // let base64String = "iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAIAAAAL........"    // base64 no head desc
        let base64String = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAIAAAAL........" //Two kinds can be resolved 
        
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imgView.image = base64StringToUIImage(base64String)
        self.view.addSubview(imgView)
        
        
        ///UIImage transformation base64String
        let img = UIImage()
        let base64StringForImg = imageToBase64String(img)
        print(base64StringForImg)
