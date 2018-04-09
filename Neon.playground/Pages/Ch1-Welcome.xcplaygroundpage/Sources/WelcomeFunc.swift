import Foundation
import UIKit


// Gradient Lines
public func addGradientLines(to gradientLayer: CAGradientLayer) -> Void{
    let SCREENSIZE = Nemo.SCREENSIZE
    // container
    let lineContainerLayer = CALayer()
    lineContainerLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    lineContainerLayer.position = CGPoint(x: SCREENSIZE/2, y: SCREENSIZE/2)
    lineContainerLayer.bounds = CGRect(x: 0, y: 0, width: SCREENSIZE, height: SCREENSIZE)
    //subLine
    let lineCuont = 20
    let stepSize = Int(SCREENSIZE / lineCuont)
    var startPoint = CGPoint.zero
    var endPoint = CGPoint.zero
    var subPath:CGMutablePath
    // loop
    for i in 0..<lineCuont+1{
        // upper line
        startPoint = CGPoint(x: 0, y: SCREENSIZE-i*stepSize)
        endPoint = CGPoint(x: stepSize*i, y: 0)
        let subLine1 = CAShapeLayer()
        subPath = CGMutablePath()
        subPath.move(to: startPoint)
        subPath.addLine(to: endPoint)
        subLine1.path = subPath
        subLine1.strokeColor = UIColor.black.cgColor
        subLine1.position = CGPoint(x: 0, y: 0)
        // lower line
        startPoint = CGPoint(x: i*stepSize, y: SCREENSIZE)
        endPoint = CGPoint(x: SCREENSIZE, y: SCREENSIZE-i*stepSize)
        let subLine2 = CAShapeLayer()
        subPath = CGMutablePath()
        subPath.move(to: startPoint)
        subPath.addLine(to: endPoint)
        subLine2.path = subPath
        subLine2.strokeColor = UIColor.black.cgColor
        subLine2.position = CGPoint(x: 0, y: 0)
        
        lineContainerLayer.addSublayer(subLine1)
        lineContainerLayer.addSublayer(subLine2)
    }
    
    // gradient layer
    let colors = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).cgColor,#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor]
    gradientLayer.startPoint = CGPoint(x: 1, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    gradientLayer.colors = colors
    gradientLayer.position = CGPoint(x: SCREENSIZE/2, y: SCREENSIZE/2)
    gradientLayer.bounds = lineContainerLayer.bounds
    gradientLayer.mask = lineContainerLayer
    // ani
    let ani = CABasicAnimation(keyPath: "transform.rotation")
    ani.fromValue = CATransform3DIdentity
    ani.toValue = CATransform3DRotate(CATransform3DIdentity, .pi*0.5, 0, 0, 1.0)
    // ani2
    let ani2 = CABasicAnimation(keyPath: "transform.scale")
    ani2.toValue = CATransform3DIdentity
    ani2.fromValue = CATransform3DScale(CATransform3DIdentity, 2, 2, 1)
    // ani3
    let ani3 = CABasicAnimation(keyPath: "opacity")
    ani3.fromValue = 0
    ani3.toValue = 1
    // ani group
    let aniGroup = CAAnimationGroup()
    aniGroup.animations = [ani, ani2, ani3]
    aniGroup.duration = 3
    aniGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    gradientLayer.add(aniGroup, forKey: "group")
    
}




// icon show

public func iconShow(on bg: UIView) -> Void{
    let txtLayer = CATextLayer()
    txtLayer.string = " WWDC18"
    txtLayer.frame = bg.frame.insetBy(dx: 150, dy: 200)
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
    txtAni.damping = 2.5
    txtLayer.shadowOffset = offset
    //txtLayer.shadowRadius
    let txtAni2 = CASpringAnimation(keyPath: "shadowRadius")
    let radius = CGFloat(3)
    txtAni2.fromValue = 3
    txtAni2.toValue = radius
    txtAni2.initialVelocity = -50
    txtAni2.damping = 2.5
    txtLayer.shadowRadius = radius
    // shadowopacity
    let txtAniInit = CABasicAnimation(keyPath: "shadowOpacity")
    txtAniInit.fromValue = 0
    txtAniInit.toValue = 1
    txtAniInit.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    txtAniInit.duration = 1
    txtAniInit.isRemovedOnCompletion = false
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3.1) {
        txtLayer.shadowOpacity = 1
    }
    // ani group
    let aniGroup = CAAnimationGroup()
    aniGroup.animations = [txtAniInit, txtAni2, txtAni]
    aniGroup.duration = 30
    aniGroup.beginTime = CACurrentMediaTime() + 3.1
    txtLayer.add(aniGroup, forKey: "txtAniGroup")
    
    bg.layer.addSublayer(txtLayer)
    
}



// NEON shaking
public func addNeon(to neonBaseLayer: CALayer){
    let SCREENSIZE = Nemo.SCREENSIZE
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
    
    neonBaseLayer.addSublayer(txtLayerN)
    neonBaseLayer.addSublayer(txtLayerE)
    neonBaseLayer.addSublayer(txtLayerO)
    neonBaseLayer.addSublayer(txtLayerN2)
    
    // base show ani
    neonBaseLayer.opacity = 0
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+7.0) {
        neonBaseLayer.opacity = 1
    }
    let baseAni = CASpringAnimation(keyPath: "opacity")
    baseAni.fromValue = 0
    baseAni.toValue = 1
    baseAni.damping = 2
    //baseAni.initialVelocity = 20
    baseAni.duration = 3
    baseAni.beginTime = CACurrentMediaTime()+5.0
    neonBaseLayer.add(baseAni, forKey: "baseAni")
    neonBaseLayer.position = CGPoint(x:CGFloat(SCREENSIZE/2) - charSize.width*2, y: CGFloat(SCREENSIZE*1/2))
    
//    return CGSize(width: charSize.width*4, height: charSize.height)
}

