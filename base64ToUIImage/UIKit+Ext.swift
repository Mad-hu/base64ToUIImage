//
//  UIImage+Ext.swift
//  base64ToUIImage
//
//  Created by mac on 2016/11/17.
//  Copyright © 2016年 Mad-hu. All rights reserved.
//

import UIKit
extension UIImage {
    ///传入图片image回传对应的base64字符串,默认不带有data标识, imgType自定义 默认png
    func getBase64String(headerSign:Bool = false,imgType:String = "png")->String?{
        
        ///根据图片得到对应的二进制编码
        guard let imageData = UIImagePNGRepresentation(self) else {
            return nil
        }
        ///根据二进制编码得到对应的base64字符串
        var base64String = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue:0))
        ///判断是否带有头部base64标识信息
        if headerSign {
            ///根据格式拼接数据头 添加header信息，扩展名信息
            base64String = "data:image/\(imgType);base64," + base64String
        }
        return base64String
    }
    
    
}

extension String {
    ///传入图片image名称回传对应的base64字符串,默认不带有data标识,
    /// According to the string to get the image converted into base64 string
    /// * imageName stringName get UIImage
    /// * headerSign default false:no base64 data sign,
    /// * imgType Sign for that type of picture
    func getImageConvertedToBase64String(headerSign:Bool = false,imgType:String = "png")->String?{
        ///根据名称获取图片
        guard let image : UIImage = UIImage(named:self) else {
            return nil
        }
        return image.getBase64String(headerSign: headerSign, imgType: imgType)
    }
    
    
    ///传入base64的字符串，可以是没有经过修改的转换成的以data开头的，也可以是base64的内容字符串，然后转换成UIImage
    func base64StringToUIImage()->UIImage? {
        var str = self
        
        // 1、判断用户传过来的base64的字符串是否是以data开口的，如果是以data开头的，那么就获取字符串中的base代码，然后在转换，如果不是以data开头的，那么就直接转换
        if str.hasPrefix("data:image") {
            guard let newBase64String = str.components(separatedBy: ",").last else {
                return nil
            }
            str = newBase64String
        }
        // 2、将处理好的base64String代码转换成NSData
        guard let imgNSData = Data(base64Encoded: str, options: NSData.Base64DecodingOptions()) else {
            return nil
        }
        // 3、将NSData的图片，转换成UIImage
        guard let codeImage = UIImage(data: imgNSData) else {
            return nil
        }
        return codeImage
    }

}
