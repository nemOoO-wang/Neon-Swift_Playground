import Foundation
import UIKit



// Apple Show
public func appleShowing() -> CATextLayer{
    let Screensize = Nemo.SCREENSIZE
    let txtLayer = CATextLayer()
    txtLayer.string = ""
    txtLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    txtLayer.position = CGPoint(x: Screensize/2, y: Screensize/2)
    txtLayer.fontSize = 60
    txtLayer.bounds = CGRect(x: 0, y: 0, width: Screensize, height: 70)
    txtLayer.alignmentMode = kCAAlignmentCenter
    txtLayer.shadowColor = UIColor.black.cgColor
    txtLayer.shadowOpacity = 0
    txtLayer.shadowOffset = CGSize.zero
    // txt ani
    //txtLayer.shadowOffset
    let txtAni = CASpringAnimation(keyPath: "shadowOffset")
    txtAni.fromValue = CGSize.zero
    let offset = CGSize(width: 4, height: 4)
    txtAni.toValue = offset
    txtAni.initialVelocity = 6
    txtAni.duration = 3
    txtAni.damping = 2
    txtAni.autoreverses = true
    txtLayer.shadowOffset = offset
    //txtLayer.shadowRadius
    let txtAni2 = CASpringAnimation(keyPath: "shadowRadius")
    let radius = CGFloat(3)
    txtAni2.fromValue = 3
    txtAni2.toValue = radius
    txtAni2.initialVelocity = -20
    txtAni2.damping = 2
    txtAni2.autoreverses = true
    txtLayer.shadowRadius = radius
    // shadowopacity
    let txtAniInit = CABasicAnimation(keyPath: "shadowOpacity")
    txtAniInit.fromValue = 0
    txtAniInit.toValue = 1
    txtAniInit.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    txtAniInit.duration = 1
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
        txtLayer.shadowOpacity = 1
    }
    // ani group
    let aniGroup = CAAnimationGroup()
    aniGroup.animations = [txtAni2, txtAni]
    aniGroup.duration = 3
    txtLayer.add(aniGroup, forKey: "txtAniGroup")
    txtLayer.add(txtAniInit, forKey: "shadowOpa")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
        let fadeAni = CABasicAnimation(keyPath: "opacity")
        fadeAni.fromValue = 1
        fadeAni.toValue = 0
        fadeAni.duration = 0.3
        txtLayer.add(fadeAni, forKey: "fade")
        txtLayer.opacity = 0
    }
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3.0) {
        txtLayer.removeFromSuperlayer()
    }
    return txtLayer
}




// Apple Show And Stay

public func appleShowAndStaying() -> CATextLayer{
    let Screensize = Nemo.SCREENSIZE
    let txtLayer = CATextLayer()
    txtLayer.string = ""
    txtLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    txtLayer.position = CGPoint(x: Screensize/2, y: Screensize/3)
    txtLayer.fontSize = 60
    txtLayer.bounds = CGRect(x: 0, y: 0, width: Screensize, height: 70)
    txtLayer.alignmentMode = kCAAlignmentCenter
    txtLayer.shadowColor = UIColor.black.cgColor
    txtLayer.shadowOpacity = 0
    txtLayer.shadowOffset = CGSize.zero
    // txt ani
    //txtLayer.shadowOffset
    let txtAni = CASpringAnimation(keyPath: "shadowOffset")
    txtAni.fromValue = CGSize.zero
    let offset = CGSize(width: 4, height: 4)
    txtAni.toValue = offset
    txtAni.initialVelocity = 6
    txtAni.duration = 3
    txtAni.damping = 2
    txtAni.autoreverses = true
    txtLayer.shadowOffset = offset
    //txtLayer.shadowRadius
    let txtAni2 = CASpringAnimation(keyPath: "shadowRadius")
    let radius = CGFloat(3)
    txtAni2.fromValue = 3
    txtAni2.toValue = radius
    txtAni2.initialVelocity = -20
    txtAni2.damping = 2
    txtAni2.autoreverses = true
    txtLayer.shadowRadius = radius
    // shadowopacity
    let txtAniInit = CABasicAnimation(keyPath: "shadowOpacity")
    txtAniInit.fromValue = 0
    txtAniInit.toValue = 1
    txtAniInit.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    txtAniInit.duration = 1
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
        txtLayer.shadowOpacity = 1
    }
    // ani group
    let aniGroup = CAAnimationGroup()
    aniGroup.animations = [txtAni2, txtAni]
    aniGroup.duration = 2.2
    aniGroup.repeatCount = .infinity
    txtLayer.add(aniGroup, forKey: "txtAniGroup")
    txtLayer.add(txtAniInit, forKey: "shadowOpa")
    return txtLayer
}




// Board Showing

/** Usage:
 let string = "Coca Cola"
 let baseColor = boardColors[0]
 
 let baseLayer = showNeonBoard(text: string, with: baseColor)
 bg.layer.addSublayer(baseLayer)
 */


public func showNeonBoard(text string:String, with baseColor:UIColor, clickwise onIs1:Int) -> CALayer{
    let baseLayer = getNeonBoard(string, color: baseColor)
    let showTime = 0.5
    let shakeTime = 1.5
    let fadeTime = 0.3
    let fadeGoTime = 0.4
    // come ani
    /// come
    let aniCome = CABasicAnimation(keyPath: "opacity")
    aniCome.fromValue = 0
    aniCome.toValue = 1
    /// rotate
    let aniRotate = CABasicAnimation(keyPath: "transform.rotation")
    let tileValue = CGFloat.pi * CGFloat(onIs1)
    aniRotate.fromValue = CATransform3DRotate(CATransform3DIdentity, tileValue, 0, 0, 1)
    aniRotate.toValue = CATransform3DRotate(CATransform3DIdentity, .pi*0.5, 0, 0, 1)
    /// scale
    let aniScale = CABasicAnimation(keyPath: "transform.scale")
    aniScale.fromValue = CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 1)
    aniScale.toValue = CATransform3DScale(CATransform3DIdentity, 1, 1.2, 1.2)
    /// group
    let aniShowGroup = CAAnimationGroup()
    aniShowGroup.duration = showTime
    aniShowGroup.animations = [aniCome, aniRotate, aniScale]
    aniShowGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    // shake ani
    /// scale
    let shakeScaleAni = CABasicAnimation(keyPath: "transform.scale")
    shakeScaleAni.fromValue = CATransform3DIdentity
    shakeScaleAni.toValue = CATransform3DScale(CATransform3DIdentity, 1.1, 1.1, 1)
    /// tilt
    let shakeTiltAni = CABasicAnimation(keyPath: "transform.rotation")
    shakeTiltAni.fromValue = CATransform3DRotate(CATransform3DIdentity, .pi*0.51, 0, 1, 0)
    shakeTiltAni.toValue = CATransform3DRotate(CATransform3DIdentity, .pi*0.5, 0, 1, 0)
    /// group
    let shakeAniGroup = CAAnimationGroup()
    shakeAniGroup.animations = [shakeScaleAni,  shakeTiltAni]
    shakeAniGroup.duration = 0.5
    shakeAniGroup.autoreverses = true
    shakeAniGroup.repeatCount = .infinity
    shakeAniGroup.beginTime = CACurrentMediaTime()+showTime
    // add animations
    baseLayer.add(aniShowGroup, forKey: "aniShowGroup")
    baseLayer.add(shakeAniGroup, forKey: "aniShakeGroup")
    
    // delay to fade
    let tmpTime = showTime + shakeTime
    let disTime = DispatchTime.now() + tmpTime
    DispatchQueue.main.asyncAfter(deadline: disTime) {
        baseLayer.removeAllAnimations()
        // fade ani
        /// rotation
        let aniFadeRotate = CABasicAnimation(keyPath: "transform.rotation")
        aniFadeRotate.fromValue = CATransform3DMakeRotation(.pi*0.5, 0, 1, 0)
        aniFadeRotate.toValue = CATransform3DMakeRotation(.pi*0.48, 0, 1, 0)
        /// scale
        let aniFadeScale = CABasicAnimation(keyPath: "transform.scale")
        aniFadeScale.fromValue = CATransform3DIdentity
        aniFadeScale.toValue = CATransform3DMakeScale(1.8, 1.8, 1)
        let aniFadeGroup = CAAnimationGroup()
        aniFadeGroup.animations = [aniFadeRotate, aniFadeScale]
        aniFadeGroup.autoreverses = true
        aniFadeGroup.duration = fadeTime/2
        // add
        baseLayer.add(aniFadeGroup, forKey: "aniFadeGroup")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+fadeTime, execute: {
            // fade go ani
            /// rotate
            let aniFadeGoRotat = CABasicAnimation(keyPath: "transform.rotation")
            aniFadeGoRotat.fromValue = CATransform3DMakeRotation(.pi*0.5, 0, 1, 0)
            aniFadeGoRotat.toValue = CATransform3DMakeRotation(.pi*0.56, 0, 1, 0)
            /// scale
            let aniFadeGoScale = CABasicAnimation(keyPath: "transform.scale")
            aniFadeGoScale.fromValue = CATransform3DIdentity
            aniFadeGoScale.toValue = CATransform3DScale(CATransform3DIdentity, 0.01, 0.01, 1)
            /// opacity
            let aniFadeGoCome = CABasicAnimation(keyPath: "opacity")
            aniFadeGoCome.fromValue = 1
            aniFadeGoCome.toValue = 0
            /// group
            let aniFadeGoGroup = CAAnimationGroup()
            aniFadeGoGroup.animations = [aniFadeGoRotat, aniFadeGoScale, aniFadeGoCome]
            aniFadeGoGroup.duration = fadeGoTime
            baseLayer.add(aniFadeGoGroup, forKey: "aniFadeGoGroup")
            //            baseLayer.opacity = 0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+fadeGoTime-0.1, execute: {
                baseLayer.removeFromSuperlayer()
            })
        })
    }
    return baseLayer
}




// Board Showing With Apple

/** Usage:
 let board = showAppleNeonBoard(text: "apple", with: colorPair, clickwise: 1, flashSpeed: 3)
 
 */

public func showAppleNeonBoard(text string:String, with colorPair:Array<UIColor>, clickwise onIs1:Int, flashSpeed:Int) -> CALayer{
    let board = showNeonBoard(text: string, with: colorPair[1], clickwise: onIs1)
    let appleLayer = CATextLayer()
    appleLayer.string = ""
    appleLayer.fontSize = 30
    appleLayer.foregroundColor = colorPair[0].cgColor
    appleLayer.alignmentMode = kCAAlignmentCenter
    appleLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
    appleLayer.position = CGPoint(x: 34, y: 27)
    ////appleLayer.shadowOffset = CGSize.zero
    // animation
    if flashSpeed>0 {
        let appleAni = CABasicAnimation(keyPath: "foregroundColor")
        appleAni.toValue = colorPair[1].cgColor
        appleAni.fromValue = colorPair[0].cgColor
        appleAni.duration = 0.5/Double(flashSpeed)
        appleAni.autoreverses = true
        appleAni.repeatCount = .infinity
        appleLayer.add(appleAni, forKey: "flash")
    }
    board.addSublayer(appleLayer)
    return board
}




// Circle Bounding

/** Usage:
 
 let circleLayer = circleBounding(with: colorPair)
 bg.layer.addSublayer(circleLayer)
 
 */

public func circleBounding(with colorPair: Array<UIColor>) -> CAShapeLayer{
    // animate time
    let showTime = 1.5
    let fadeTime = 1.0
    // get layer
    let circleLayer = getCircle(with: colorPair)
    // layer ani
    /// show
    let tran = CATransform3DMakeScale(12, 12, 1)
    let ani1 = CASpringAnimation(keyPath: "transform")
    ani1.fromValue = CATransform3DIdentity
    ani1.toValue = tran
    ani1.damping = 5
    ani1.initialVelocity = 10
    ani1.duration = showTime
    let boudingTime = ani1.settlingDuration
    circleLayer.add(ani1, forKey: "ani1")
    circleLayer.transform = tran
    /// fade
    let ani2 = CABasicAnimation(keyPath: "opacity")
    ani2.fromValue = 1
    ani2.toValue = 0
    ani2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    ani2.duration = fadeTime
    ani2.beginTime = CACurrentMediaTime() + boudingTime
    circleLayer.add(ani2, forKey: "ani2")
    let tmpTime2 = showTime + boudingTime - 1.0
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+tmpTime2) {
        circleLayer.opacity = 0
    }
    let tmpTime = fadeTime + showTime + boudingTime
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+tmpTime) {
        circleLayer.removeFromSuperlayer()
    }
    
    return circleLayer
}





// Circle Expanding

/** Usage:
 
 let cir = CircleExpanding()
 
 */

public func CircleExpanding() -> CAShapeLayer{
    // timing
    // delay 1 second after 1st oval shown
    let comingTime = 0.5
    let slowExpanTime = 2.1
    let mediumScale = CGFloat(5)
    let expanTime = 2.0
    // settings
    let Screensize = Nemo.SCREENSIZE
    let cColor = UIColor.white
    let circleRadius = 20
    let shadowBigger = 5
    let circle = CAShapeLayer()
    circle.path = CGPath(ellipseIn: CGRect(x: -circleRadius, y: -circleRadius, width: circleRadius*2, height: circleRadius*2), transform: nil)
    circle.fillColor = cColor.cgColor
    circle.position = CGPoint(x: Screensize/2, y: Screensize/2)
    // shadow
    circle.shadowPath = CGPath(ellipseIn: CGRect(x: -(circleRadius+shadowBigger), y: -(circleRadius+shadowBigger), width: (circleRadius+shadowBigger)*2, height: (circleRadius+shadowBigger)*2), transform: nil)
    circle.shadowOffset = CGSize.zero
    circle.shadowColor = cColor.cgColor
    circle.shadowRadius = 10
    circle.shadowOpacity = 1
    // ani
    let fastExpan = CABasicAnimation(keyPath: "transform.scale")
    fastExpan.fromValue = CATransform3DIdentity
    fastExpan.toValue = CATransform3DMakeScale(50, 50, 1)
    fastExpan.duration = expanTime
    fastExpan.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    circle.add(fastExpan, forKey: "fastExpan")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+expanTime, execute: {
        circle.removeFromSuperlayer()
    })
    //    /// show
    //    let showAni = CABasicAnimation(keyPath: "opacity")
    //    showAni.fromValue = 0
    //    showAni.toValue = 1
    //    showAni.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    //    showAni.duration = comingTime
    //    circle.add(showAni, forKey: "show")
    //    /// slow expan
    //    let slowExpanAni = CABasicAnimation(keyPath: "transform")
    //    slowExpanAni.fromValue = CATransform3DIdentity
    //    slowExpanAni.toValue = CATransform3DMakeScale(mediumScale, mediumScale, 1)
    //    slowExpanAni.beginTime = CACurrentMediaTime() + comingTime
    //    slowExpanAni.duration = slowExpanTime
    //    slowExpanAni.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    //    circle.add(slowExpanAni, forKey: "slowExpan")
    //    /// fast expan
    //    let beginTime = comingTime + slowExpanTime - 0.2
    //    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+beginTime) {
    //        circle.transform = CATransform3DMakeScale(mediumScale, mediumScale, 1)
    //        let fastExpan = CABasicAnimation(keyPath: "transform.scale")
    //        fastExpan.fromValue = CATransform3DMakeScale(mediumScale, mediumScale, 1)
    //        fastExpan.toValue = CATransform3DMakeScale(50, 50, 1)
    //        fastExpan.duration = expanTime
    //        fastExpan.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    //        circle.add(fastExpan, forKey: "fastExpan")
    //        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+expanTime, execute: {
    //            circle.removeFromSuperlayer()
    //        })
    //    }
    
    return circle
}




// GradientLayer

public func gradientInitiate() -> CAGradientLayer{
    // settings
    let gradientCGColors = [#colorLiteral(red: 0.6336437361, green: 0.8903672272, blue: 0.4604207523, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor, #colorLiteral(red: 0.8169697786, green: 0.6903436435, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.4242472921, green: 0.5267455537, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.583850059, blue: 0.724180476, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.2770538005, blue: 0.4478188362, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.5304031388, blue: 0.3329952343, alpha: 1).cgColor, #colorLiteral(red: 0.9857871472, green: 1, blue: 0.5680258266, alpha: 1).cgColor, #colorLiteral(red: 0.3554704732, green: 0.8420843909, blue: 0.6351748796, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor]
    let showingTime = 1.0
    let screenOffset = 140
    let Screensize = Nemo.SCREENSIZE + screenOffset
    // init
    let gradientLayer = CAGradientLayer()
    gradientLayer.anchorPoint = CGPoint.zero
    gradientLayer.position = CGPoint(x: -screenOffset/2, y: -screenOffset/2)
    gradientLayer.bounds = CGRect(x: 0, y: 0, width: Screensize, height: Screensize)
    gradientLayer.colors = gradientCGColors
    gradientLayer.locations = [0,1,1,1,1,1,1,1,1]
    gradientLayer.startPoint = CGPoint(x: 0, y: 1)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    // showing
    let ani = CABasicAnimation(keyPath: "opacity")
    ani.fromValue = 0
    ani.toValue = 1
    ani.duration = showingTime
    gradientLayer.add(ani, forKey: "showing")
    // rotate
    gradientLayer.colors = gradientCGColors
    gradientLayer.locations = [0,1,1,1,1,1,1,1,1]
    gradientLayer.startPoint = CGPoint(x: 0, y: 1)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    /// startpoint
    let ani2 = CAKeyframeAnimation(keyPath: "startPoint")
    ani2.values = [CGPoint(x: 0, y: 0),CGPoint(x: 0, y: 1),CGPoint(x: 1, y: 1),CGPoint(x: 1, y: 0)]
    ani2.keyTimes = [0,0.33,0.66,1]
    /// endpoint
    let ani3 = CAKeyframeAnimation(keyPath: "endPoint")
    ani3.values = [CGPoint(x: 1, y: 1),CGPoint(x: 1, y: 0),CGPoint(x: 0, y: 0),CGPoint(x: 0, y: 1)]
    ani3.keyTimes = [0,0.33,0.66,1]
    /// group
    let aniGroup = CAAnimationGroup()
    aniGroup.animations = [ani2, ani3]
    aniGroup.duration = 3
    aniGroup.autoreverses = true
    aniGroup.repeatCount = .infinity
    gradientLayer.add(aniGroup, forKey: "group")
    
    return gradientLayer
}


// animation func
public func gradientMoving(to next: Bool, on gradientLayer: CAGradientLayer) -> Void {
    // timing
    let changeTime = 4.0
    // settings
    var logIndex = 0
    let tmpLoca = gradientLayer.locations
    for var i in 0 ..< (tmpLoca?.count)! {
        if tmpLoca![i] == 1 {
            logIndex = i
            break
        }
    }
    var newLocations = [0,0,1,1,1,1,1,1,1]
    if next {
        // next
        if logIndex == (tmpLoca?.count)!-1 {
            newLocations = gradientLayer.locations as! [Int]
        }else{
            for var i in 0 ..< (tmpLoca?.count)!{
                if i<=logIndex {
                    newLocations[i] = 0
                }else{
                    newLocations[i] = 1
                }
            }
        }
    }else{
        // return last color
        if logIndex == 0 {
            newLocations = gradientLayer.locations as! [Int]
        }else{
            for var i in 0..<(tmpLoca?.count)!{
                if i>=logIndex {
                    newLocations[i] = 1
                }else{
                    newLocations[i] = 0
                }
            }
        }
    }
    
    // ani
    let anii = CABasicAnimation(keyPath: "locations")
    anii.fromValue = gradientLayer.locations
    anii.toValue = newLocations
    anii.duration = changeTime
    gradientLayer.add(anii, forKey: "locations")
    gradientLayer.locations = newLocations as [NSNumber]
}
/// used Func

//
//    /// revert movement
//    let aniStartFrom:CGPoint = gradientLayer.startPoint
//    var aniStartTo = CGPoint.zero
//    // sub func
//    func oneOrZero(_ n:Int)->Int{
//        if n == 1 {
//            return 0
//        }
//        return 1
//    }
//    if aniStartFrom.x != aniStartFrom.y {
//        aniStartTo.x = CGFloat(oneOrZero(Int(aniStartFrom.x)))
//        aniStartTo.y = aniStartFrom.y
//    }else{
//        aniStartTo.x = aniStartFrom.x
//        aniStartTo.y = CGFloat(oneOrZero(Int(aniStartFrom.y)))
//    }
//    let aniEndFrom = gradientLayer.endPoint
//    let aniEndTo = CGPoint(x: oneOrZero(Int(aniStartTo.x)), y: oneOrZero(Int(aniStartTo.y)))
//    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+changeTime) {
////        gradientLayer.colors = [newColor, mediumColor]
//        /// startpoint
//        let ani2 = CABasicAnimation(keyPath: "startPoint")
//        ani2.fromValue = aniStartFrom
//        ani2.toValue = aniStartTo
//        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
//        /// endpoint
//        let ani3 = CABasicAnimation(keyPath: "endPoint")
//        ani3.fromValue = aniEndFrom
//        ani3.toValue = aniEndTo
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
//        /// group
//        let aniGroup = CAAnimationGroup()
//        aniGroup.animations = [ani2, ani3]
//        aniGroup.duration = moveTime
//
//        gradientLayer.add(aniGroup, forKey: "group")
//    }



// Hollow Show

/** Usage:
 
 let result = HollowShowing(with: "yeprrrr", inColors: colorPairs[0], asType: .roundRect)
 bg.layer.addSublayer(result.containerLayer)
 
 */

// enum

public enum HollowNeonTextType: Int{
    case original=0, roundRect, circle
}



// func

public func HollowShowing(with text:String, inColors colorPair: [UIColor], asType type: HollowNeonTextType) -> (containerLayer: CALayer, size: CGSize){
    // settings
    let showTime = 0.5
    let stayTime = 1.5
    let fadeTime = 0.5
    // bake
    let result: (containerLayer: CALayer, size: CGSize)
    /// switch
    switch type {
    case .original:
        result = getHollow(text, with: colorPair)
        
    case .roundRect:
        result = getHollowInRect(text, with: colorPair)
        
    case .circle:
        result = getHollowInCircle(text, with: colorPair)
        
    default:
        result = getHollow(text, with: colorPair)
    }
    let layer = result.containerLayer
    // show
    /// scale
    let aniShowScale = CABasicAnimation(keyPath: "transform.scale")
    aniShowScale.fromValue = CATransform3DMakeScale(0.2, 0.2, 0.2)
    aniShowScale.toValue = CATransform3DIdentity
    /// rotate
    /// rotate
    let aniRotate = CABasicAnimation(keyPath: "transform.rotation")
    let tileValue = CGFloat.pi*0
    aniRotate.fromValue = CATransform3DRotate(CATransform3DIdentity, tileValue, 0, 0, 1)
    aniRotate.toValue = CATransform3DRotate(CATransform3DIdentity, .pi*0.5, 0, 0, 1)
    /// opa
    let aniShowOpa = CABasicAnimation(keyPath: "opacity")
    aniShowOpa.fromValue = 0
    aniShowOpa.toValue = 1
    /// group
    let aniShowGroup = CAAnimationGroup()
    aniShowGroup.animations = [aniShowScale, aniShowOpa, aniRotate]
    aniShowGroup.duration = showTime
    layer.add(aniShowGroup, forKey: "showGroup")
    // flash
    //// flash
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + showTime) {
        let ani = CABasicAnimation(keyPath: "opacity")
        ani.fromValue = 0
        ani.toValue = 1
        ani.repeatCount = 2
        ani.duration = 0.1
        layer.add(ani, forKey: "opa")
    }
    // fade
    let showTmpTime = showTime + stayTime
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+showTmpTime) {
        // fade
        let aniFadeScale = CABasicAnimation(keyPath: "transform.scale")
        aniFadeScale.fromValue = CATransform3DIdentity
        aniFadeScale.toValue = CATransform3DMakeScale(0.2, 0.2, 0.2)
        /// fade
        let aniFadeRotate = CABasicAnimation(keyPath: "transform.rotation")
        let tileValue1 = CGFloat.pi*1
        aniFadeRotate.fromValue = CATransform3DRotate(CATransform3DIdentity, .pi*0.5, 0, 0, 1)
        aniFadeRotate.toValue = CATransform3DRotate(CATransform3DIdentity, tileValue1, 0, 0, 1)
        /// opa
        let aniFadeOpa = CABasicAnimation(keyPath: "opacity")
        aniFadeOpa.fromValue = 1
        aniFadeOpa.toValue = 0
        /// group
        let aniFadeGroup = CAAnimationGroup()
        aniFadeGroup.animations = [aniFadeScale, aniFadeOpa,aniFadeRotate]
        aniFadeGroup.duration = fadeTime
        layer.add(aniFadeGroup, forKey: "fadeGroup")
        let tmpTime = fadeTime - 0.1
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+tmpTime, execute: {
            layer.removeFromSuperlayer()
        })
    }
    return result
}




// Neon Shaking

public func NeonShaking() -> CALayer{
    let ScreenSize = Nemo.SCREENSIZE
    let colorPairs = [[#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)],[#colorLiteral(red: 0.7616403448, green: 0.9479464443, blue: 1, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)],[#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)],[#colorLiteral(red: 1, green: 0.6731340306, blue: 0.7571223992, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)],[#colorLiteral(red: 0.7560469665, green: 0.6728259933, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)],[#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)]]
    
    // aniN
    let aniN = CABasicAnimation(keyPath: "transform")
    aniN.fromValue = CATransform3DMakeRotation(.pi*0.01, 0, 0, 1)
    aniN.fromValue = CATransform3DMakeRotation(.pi*(-0.01), 0, 0, 1)
    aniN.duration = 0.1
    aniN.repeatCount = .infinity
    aniN.autoreverses = true
    // aniE
    let aniE = CABasicAnimation(keyPath: "transform")
    aniE.fromValue = CATransform3DMakeRotation(.pi*0.01, 0, 0, 1)
    aniE.toValue = CATransform3DMakeRotation(.pi*(-0.01), 0, 0, 1)
    aniE.duration = 0.2
    aniE.repeatCount = .infinity
    aniE.autoreverses = true
    // aniO
    let aniO = CABasicAnimation(keyPath: "transform")
    aniO.fromValue = CATransform3DMakeRotation(.pi*0.01, 0, 0, 1)
    aniO.toValue = CATransform3DMakeRotation(.pi*(-0.01), 0, 0, 1)
    aniO.duration = 0.15
    aniO.repeatCount = .infinity
    aniO.autoreverses = true
    // aniN2
    let aniN2 = CABasicAnimation(keyPath: "transform")
    aniN2.toValue = CATransform3DMakeRotation(.pi*0.01, 0, 0, 1)
    aniN2.fromValue = CATransform3DMakeRotation(.pi*(-0.01), 0, 0, 1)
    aniN2.duration = 0.15
    aniN2.repeatCount = .infinity
    aniN2.autoreverses = true
    // N
    let resultN = neonTextLayer(with: "N", and: colorPairs[0])
    let txtLayerN = resultN.neonTextLayer
    let charSize = resultN.textRect
    txtLayerN.add(aniN, forKey: "aniN")
    // E
    let resultE = neonTextLayer(with: "E", and: colorPairs[1])
    let txtLayerE = resultE.neonTextLayer
    txtLayerE.position = CGPoint(x: charSize.width, y: 0)
    txtLayerE.add(aniE, forKey: "aniE")
    // O
    let resultO = neonTextLayer(with: "O", and: colorPairs[2])
    let txtLayerO = resultO.neonTextLayer
    txtLayerO.position = CGPoint(x: charSize.width*2, y: 0)
    txtLayerO.add(aniO, forKey: "aniO")
    // N
    let resultN2 = neonTextLayer(with: "N", and: colorPairs[3])
    let txtLayerN2 = resultN2.neonTextLayer
    txtLayerN2.position = CGPoint(x: charSize.width*3, y: 0)
    txtLayerN2.add(aniN2, forKey: "aniN2")
    
    let neonBaseLayer = CALayer()
    neonBaseLayer.position = CGPoint(x:CGFloat(ScreenSize/2) - charSize.width*2, y: CGFloat(ScreenSize*1/2))
    
    neonBaseLayer.addSublayer(txtLayerN)
    neonBaseLayer.addSublayer(txtLayerE)
    neonBaseLayer.addSublayer(txtLayerO)
    neonBaseLayer.addSublayer(txtLayerN2)
    
    return neonBaseLayer
}





// Oval Collecting

/** Usage:
 let oval = ovalCollecting(colorPair: colorPair, inWhiteBack: false)
 bg.layer.addSublayer(oval)
 
 */

public func ovalCollecting(colorPair:Array<UIColor>, inWhiteBack isInWhite:Bool) -> CAShapeLayer{
    // ani time
    let rollingTime = 1.5
    let lightingTime = 0.05
    // setting
    let oval = getOval(with: colorPair, isInWhite)
    // ani roll
    let tran = CATransform3DScale(CATransform3DIdentity, 10, 10, 1)
    let tran2 = CATransform3DScale(CATransform3DIdentity, 0.3, 0.3, 1)
    let ani = CABasicAnimation(keyPath: "transform")
    ani.fromValue = tran
    ani.toValue = tran2
    ani.duration = rollingTime
    //    ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    oval.add(ani, forKey: "transform")
    oval.transform = tran2
    // ani light
    let subShadowLayer = oval.sublayers![0]
    let aniLight = CABasicAnimation(keyPath: "opacity")
    aniLight.fromValue = 1
    aniLight.toValue = 0
    aniLight.duration = lightingTime
    aniLight.autoreverses = true
    aniLight.beginTime = CACurrentMediaTime()+rollingTime
    subShadowLayer.add(aniLight, forKey: "aniLight")
    let tmpTime = rollingTime + lightingTime*2
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+tmpTime) {
        oval.removeFromSuperlayer()
    }
    return oval
}


