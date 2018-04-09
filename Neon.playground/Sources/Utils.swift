import Foundation
import UIKit



// UIColor Extention

//: whiter color for white background
//  light(0.1) for white
//  light(0.4) for black background
extension UIColor {
    
    public func lighter(amount : CGFloat = 0.1) -> UIColor {
        return hueColorWithBrightnessAmount(1 + amount)
    }
    
    public func darker(amount : CGFloat = 0.1) -> UIColor {
        return hueColorWithBrightnessAmount(1 - amount)
    }
    
    public func baseColorForWhiteBG() -> UIColor{
        return lighter(amount: 0.2)
    }
    
    public func colorFillInWhite() -> UIColor{
        return lighter(amount: 0.1)
    }
    
    public func colorFillInBlack() -> UIColor{
        return lighter(amount: 0.4)
    }
    
    private func hueColorWithBrightnessAmount(_ amount: CGFloat) -> UIColor {
        var hue         : CGFloat = 0
        var saturation  : CGFloat = 0
        var brightness  : CGFloat = 0
        var alpha       : CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor( hue: hue,
                            saturation: saturation,
                            brightness: brightness * amount,
                            alpha: alpha )
        } else {
            return self
        }
        
    }
}




// UIView Extention
/*
 
 /*
 size
 The size (measured in points) of the new bitmap context. This represents the size of the image returned by the UIGraphicsGetImageFromCurrentImageContext() function. To get the size of the bitmap in pixels, you must multiply the width and height values by the value in the scale parameter.
 
 opaque
 A Boolean flag indicating whether the bitmap is opaque. If you know the bitmap is fully opaque, specify true to ignore the alpha channel and optimize the bitmap’s storage. Specifying false means that the bitmap must include an alpha channel to handle any partially transparent pixels.
 
 scale
 The scale factor to apply to the bitmap. If you specify a value of 0.0, the scale factor is set to the scale factor of the device’s main screen.
 */
 public func view2Image(with view: UIView) -> UIImage? {
 UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 1)
 if let context = UIGraphicsGetCurrentContext() {
 view.layer.render(in: context)
 let image = UIGraphicsGetImageFromCurrentImageContext()
 UIGraphicsEndImageContext()
 return image!
 }
 return nil
 }
 
 
 public func convertImageToBW(image:UIImage) -> UIImage {
 let filter = CIFilter(name: "CIGaussianBlur",
 withInputParameters: ["inputRadius": 3])
 //    let filter = CIFilter(name: "CIPhotoEffectMono")
 
 // convert UIImage to CIImage and set as input
 
 let ciInput = CIImage(image: image)
 filter?.setValue(ciInput, forKey: "inputImage")
 
 // get output CIImage, render as CGImage first to retain proper UIImage scale
 
 let ciOutput = filter?.outputImage
 let ciContext = CIContext()
 let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
 
 return UIImage(cgImage: cgImage!)
 }

 */
