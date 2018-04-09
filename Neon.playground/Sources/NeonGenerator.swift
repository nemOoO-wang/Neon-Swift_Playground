import Foundation
import UIKit


// Circle

/** Usage:
 
 let circleLayer = getCircle(with: colorPair)
 bg.layer.addSublayer(circleLayer)
 
 */

public func getCircle(with colorPair:Array<UIColor>) -> CAShapeLayer{
    let Screensize = Nemo.SCREENSIZE
    // colors
    let frontColor = colorPair[0]
    let backColor = colorPair[1]
    // shape layer
    let circleLayer = CAShapeLayer()
    // draw
    let path = CGPath(ellipseIn: CGRect(x: -20, y: -20, width: 40, height: 40), transform: nil)
    circleLayer.path = path
    circleLayer.fillColor = frontColor.cgColor
    circleLayer.strokeColor = backColor.cgColor
    circleLayer.lineWidth = 0.8
    // shadow
    let sPath = CGPath(ellipseIn: CGRect(x: -25, y: -25, width: 50, height: 50), transform: nil)
    circleLayer.shadowPath = sPath
    circleLayer.shadowColor = backColor.cgColor
    circleLayer.shadowOpacity = 1
    circleLayer.shadowRadius = 15
    circleLayer.shadowOffset = CGSize.zero
    
    circleLayer.anchorPoint = CGPoint.zero
    circleLayer.position = CGPoint(x: Screensize/2, y: Screensize/2)
    
    return circleLayer
}




// Hollow (Circle)
public func getHollowInCircle(_ string:String, with colorPair:Array<UIColor>) -> (containerLayer: CALayer, size: CGSize){
    
    // settings
    let Screensize = Nemo.SCREENSIZE
    // neon colors
    let frontColor = colorPair[0]
    let backColor = colorPair[1]
    // init
    let result = getHollow(string, with: colorPair)
    // text size
    let inSize = result.size
    let inRadius: CGFloat
    if inSize.width > inSize.height {
        inRadius = inSize.width + 50
    }else{
        inRadius = inSize.height + 50
    }
    // container layer
    let containerLayer = result.containerLayer
    // base layer
    let baseLayer = CALayer()
    // front layer
    let frontLayer = CAShapeLayer()
    var tran1 = CGAffineTransform.identity
    let path = UIBezierPath(arcCenter: CGPoint(x: -inSize.width/2, y: -inSize.height/2), radius: inRadius/2, startAngle:  CGFloat(0), endAngle: CGFloat.pi*2, clockwise: true).cgPath
    frontLayer.path = path
    frontLayer.strokeColor = frontColor.cgColor
    frontLayer.lineWidth = 2
    frontLayer.fillColor = UIColor.clear.cgColor
    frontLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    frontLayer.position = CGPoint(x: inSize.width/2, y: inSize.height/2)
    frontLayer.shadowColor = backColor.cgColor
    frontLayer.shadowOffset = CGSize.zero
    frontLayer.shadowRadius = 3
    frontLayer.shadowOpacity = 1
    
    // shadow layer
    let shadowLayer = CAShapeLayer()
    let shadowRect = CGRect(x: -inSize.width/2, y: -inSize.height/2, width: inSize.width, height: inSize.height)
    var tran2 = CGAffineTransform.identity
    shadowLayer.path = path
    shadowLayer.strokeColor = backColor.cgColor
    shadowLayer.lineWidth = 1
    shadowLayer.fillColor = UIColor.clear.cgColor
    shadowLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    shadowLayer.position = CGPoint(x: inSize.width/2 + 3, y: inSize.height/2 + 2)
    shadowLayer.shadowColor = backColor.cgColor
    shadowLayer.shadowOffset = CGSize.zero
    shadowLayer.shadowRadius = 5
    shadowLayer.shadowOpacity = 1
    
    baseLayer.addSublayer(shadowLayer)
    baseLayer.addSublayer(frontLayer)
    containerLayer.addSublayer(baseLayer)
    return (containerLayer, inSize)
}




// Hollor (Rect)
public func getHollowInRect(_ string:String, with colorPair:Array<UIColor>) -> (containerLayer: CALayer, size: CGSize){
    
    // settings
    let Screensize = Nemo.SCREENSIZE
    // neon colors
    let frontColor = colorPair[0]
    let backColor = colorPair[1]
    // init
    let result = getHollow(string, with: colorPair)
    // text size
    let inSize = CGSize(width: result.size.width + 60, height: result.size.height + 15)
    // container layer
    let containerLayer = result.containerLayer
    // base layer
    let baseLayer = CALayer()
    // front layer
    let frontLayer = CAShapeLayer()
    let frontRect = CGRect(x: -inSize.width/2, y: -inSize.height/2+5, width: inSize.width, height: inSize.height)
    var tran1 = CGAffineTransform.identity
    frontLayer.path = CGPath.init(roundedRect: frontRect, cornerWidth: 10, cornerHeight: 10, transform: &tran1)
    frontLayer.strokeColor = frontColor.cgColor
    frontLayer.lineWidth = 2
    frontLayer.fillColor = UIColor.clear.cgColor
    frontLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    frontLayer.position = CGPoint.zero
    frontLayer.shadowColor = backColor.cgColor
    frontLayer.shadowOffset = CGSize.zero
    frontLayer.shadowRadius = 3
    frontLayer.shadowOpacity = 1
    
    // shadow layer
    let shadowLayer = CAShapeLayer()
    let shadowRect = CGRect(x: -inSize.width/2, y: -inSize.height/2+5, width: inSize.width, height: inSize.height)
    var tran2 = CGAffineTransform.identity
    shadowLayer.path = CGPath.init(roundedRect: frontRect, cornerWidth: 10, cornerHeight: 10, transform: &tran2)
    shadowLayer.strokeColor = backColor.cgColor
    shadowLayer.lineWidth = 1
    shadowLayer.fillColor = UIColor.clear.cgColor
    shadowLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    shadowLayer.position = CGPoint(x: 3, y: 2)
    shadowLayer.shadowColor = backColor.cgColor
    shadowLayer.shadowOffset = CGSize.zero
    shadowLayer.shadowRadius = 5
    shadowLayer.shadowOpacity = 1
    
    baseLayer.addSublayer(shadowLayer)
    baseLayer.addSublayer(frontLayer)
    containerLayer.addSublayer(baseLayer)
    return (containerLayer, inSize)
}




// Hollow (Original)

/** Usage:
 
 let colorPair = colorPairs[4]
 let string = "A String!~"
 let result = getHollow(string, with: colorPair)
 let container = result.containerLayer
 container.position = CGPoint(x: SCREENSIZE/2, y: 0)
 
 */
public func neonLightFontSize(with text:String) -> CGSize{
    let aFont = UIFont(name: "Arial Rounded MT Bold", size: 50)
    let originSize = text.boundingRect(with:CGSize(width:1000, height: 1000), options:[.usesLineFragmentOrigin], attributes:[
        NSAttributedStringKey.font: aFont ?? UIFont.systemFont(ofSize: 50)
        ], context:nil).size
    return CGSize(width: originSize.width, height: originSize.height+5)
}

// original
public func getHollow(_ string:String, with colorPair:Array<UIColor>) -> (containerLayer: CALayer, size: CGSize){
    
    // settings
    let Screensize = Nemo.SCREENSIZE
    // neon colors
    let frontColor = colorPair[0]
    let backColor = colorPair[1]
    // text size
    let inSize = neonLightFontSize(with: string)
    // container layer
    let containerLayer = CALayer()
    containerLayer.position = CGPoint(x: Screensize/2, y: Screensize/2)
    containerLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    // front layer
    let txtLayer = CATextLayer()
    // attributed string
    let aFont = UIFont(name: "Arial Rounded MT Bold", size: 50)
    let strokeTextAttributes: [NSAttributedStringKey : Any] = [
        NSAttributedStringKey.strokeColor : frontColor,
        //    NSAttributedStringKey.foregroundColor : UIColor.clear,
        NSAttributedStringKey.strokeWidth : 3.0,
        NSAttributedStringKey.font: aFont ?? UIFont.systemFont(ofSize: 50)
    ]
    var attributedStr = NSAttributedString(string: string, attributes: strokeTextAttributes)
    txtLayer.string = attributedStr
    txtLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    txtLayer.position = CGPoint(x: 0, y: 0)
    txtLayer.alignmentMode = kCAAlignmentCenter
    txtLayer.bounds = CGRect(x: 0, y: 0, width: inSize.width, height: inSize.height)
    txtLayer.shadowColor = backColor.cgColor
    txtLayer.shadowOffset = CGSize.zero
    txtLayer.shadowRadius = 3
    txtLayer.shadowOpacity = 1
    // shadow layer
    let txtShadowLayer = CATextLayer()
    // attributed string
    let bFont = UIFont(name: "Arial Rounded MT Bold", size: 70)
    let bStrokeAttri: [NSAttributedStringKey : Any] = [
        NSAttributedStringKey.strokeColor : backColor,
        NSAttributedStringKey.strokeWidth : 4.8,
        NSAttributedStringKey.font: aFont ?? UIFont.systemFont(ofSize: 50)
    ]
    var bStrokeSting = NSAttributedString(string: string, attributes: bStrokeAttri)
    txtShadowLayer.string = bStrokeSting
    txtShadowLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    txtShadowLayer.position = CGPoint(x: 3, y: 2)
    txtShadowLayer.alignmentMode = kCAAlignmentCenter
    txtShadowLayer.bounds = CGRect(x: 0, y: 0, width: inSize.width, height: inSize.height)
    txtShadowLayer.shadowColor = backColor.cgColor
    txtShadowLayer.shadowOffset = CGSize.zero
    txtShadowLayer.shadowRadius = 5
    txtShadowLayer.shadowOpacity = 1
    
    containerLayer.addSublayer(txtShadowLayer)
    containerLayer.addSublayer(txtLayer)
    return (containerLayer, inSize)
}




// Neon Board

/** Usage:
 let baseLayer = getNeonBoard(string, color: baseColor)
 
 */


public func getNeonBoard(_ string:String, color baseColor:UIColor) -> CALayer {
    let Screensize = Nemo.SCREENSIZE
    // neon text view
    let textOffset = 15
    let width = 300
    let height = 100
    // neon layer
    let baseLayer = CALayer()
    baseLayer.position = CGPoint(x: 300, y: 300)
    baseLayer.bounds = CGRect(x: 0, y: 0, width: width, height: height)
    baseLayer.backgroundColor = baseColor.cgColor
    // text
    let textLayer = CATextLayer()
    let tFont = UIFont(name: "Snell Roundhand", size: 50)
    let des = tFont?.fontDescriptor.withSymbolicTraits(.traitBold)
    let aFont = UIFont(descriptor: des!, size: 50)
    let textAttributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor:UIColor.white,                                                         NSAttributedStringKey.font: aFont ?? UIFont.systemFont(ofSize: 50)]
    var attributedStr = NSAttributedString(string: string, attributes: textAttributes)
    textLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    textLayer.bounds = CGRect(x: 0, y: 0, width: width, height: height)
    textLayer.position = CGPoint(x: width/2, y: height/2+textOffset)
    textLayer.string = attributedStr
    textLayer.alignmentMode = kCAAlignmentCenter
    baseLayer.addSublayer(textLayer)
    // corner
    baseLayer.cornerRadius = 50
    baseLayer.masksToBounds = false
    // border
    baseLayer.borderWidth = 6
    baseLayer.borderColor = baseColor.darker().cgColor
    // shadow
    baseLayer.shadowColor = baseColor.cgColor
    baseLayer.shadowOpacity = 1
    baseLayer.shadowRadius = 20
    baseLayer.shadowOffset = CGSize.zero
    return baseLayer
}



/*
 // neon text view
 let txtRect = CGRect(x: 100, y: 400, width: 600, height: 100)
 let aText = UITextView(frame: txtRect)
 aText.text = "Apple"
 aText.textColor = UIColor.white
 aText.textAlignment = .center
 let baseColor = #colorLiteral(red: 1, green: 0.2681740344, blue: 0.1958035976, alpha: 1)
 aText.backgroundColor = baseColor
 var tFont = UIFont(name: "Snell Roundhand", size: 50)
 let des = tFont?.fontDescriptor.withSymbolicTraits(.traitBold)
 tFont = UIFont(descriptor: des!, size: 50)
 aText.font = tFont
 // neon layer
 let tLayer = aText.layer
 
 // corner
 tLayer.cornerRadius = 50
 tLayer.masksToBounds = false
 
 // border
 tLayer.borderWidth = 6
 tLayer.borderColor = baseColor.darker().cgColor
 
 // corner
 tLayer.cornerRadius = 50
 tLayer.masksToBounds = false
 
 // shadow
 tLayer.shadowColor = UIColor.red.cgColor
 tLayer.shadowOpacity = 1
 tLayer.shadowRadius = 20
 tLayer.shadowOffset = CGSize.zero
 
 //bg.addSubview(aText)
 
 */





// Neon Text

public func sysFontSize50(with text:String) -> CGSize{
    let originSize = text.boundingRect(with:CGSize(width:1000, height: 1000), options:[.usesLineFragmentOrigin], attributes:[.font: UIFont.systemFont(ofSize: 50)], context:nil).size
    return CGSize(width: originSize.width, height: originSize.height+5)
}

public func neonTextLayer(with str:String, and colorPair:Array<UIColor>) -> (neonTextLayer: CALayer, textRect:CGSize){
    let baseLayer = CALayer()
    baseLayer.anchorPoint = CGPoint.zero
    baseLayer.position = CGPoint.zero
    let frontColor = colorPair[0]
    let backColor = colorPair[1]
    let inSize = sysFontSize50(with: str)
    
    // back text
    let txtLayer = CATextLayer()
    txtLayer.string = str
    txtLayer.foregroundColor = backColor.cgColor
    txtLayer.anchorPoint = CGPoint(x: 0, y: 0)
    txtLayer.position = CGPoint(x: 3, y: 2)
    txtLayer.bounds = CGRect(x: 0, y: 0, width: inSize.width, height: inSize.height)
    txtLayer.alignmentMode = kCAAlignmentCenter
    txtLayer.opacity = 0.8
    /// shadow
    txtLayer.shadowOpacity = 1
    txtLayer.shadowColor = backColor.cgColor
    txtLayer.shadowRadius = 3
    txtLayer.shadowOffset = CGSize.zero
    // front text
    let subLayer = CATextLayer()
    subLayer.string = str
    subLayer.foregroundColor = frontColor.lighter().cgColor
    subLayer.anchorPoint = CGPoint(x: 0, y: 0)
    subLayer.position = CGPoint(x: 0, y: 0)
    subLayer.bounds = CGRect(x: 0, y: 0, width: inSize.width, height: inSize.height)
    subLayer.alignmentMode = kCAAlignmentCenter
    /// shadow
    subLayer.shadowOpacity = 1
    subLayer.shadowColor = backColor.cgColor
    subLayer.shadowRadius = 5
    subLayer.shadowOffset = CGSize.zero
    
    baseLayer.addSublayer(txtLayer)
    baseLayer.addSublayer(subLayer)
    return (baseLayer, inSize)
}




// Oval

/** Usage:
 
 let oval = getOval(with: colorPair, isInWhite)
 bg.layer.addSublayer(ovel)
 
 */

public func getOval(with colorPair:Array<UIColor>, _ whiteBack:Bool ) -> CAShapeLayer{
    let Screensize = Nemo.SCREENSIZE
    // color
    let frontColor: UIColor
    let backColor = colorPair[1]
    // settings
    let backgroundColor: UIColor
    let subShadowRadius: CGFloat
    let subShadowShadowRadius: CGFloat
    let outerShadowRadius: CGFloat
    if whiteBack {
        backgroundColor = UIColor.white
        frontColor = colorPair[0]
        outerShadowRadius = 50
        subShadowRadius = 50
        subShadowShadowRadius = 10
    }else{
        backgroundColor = UIColor.black
        frontColor = UIColor.white
        outerShadowRadius = 55
        subShadowRadius = 43
        subShadowShadowRadius = 5
    }
    // oval
    let oval = CAShapeLayer()
    oval.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    oval.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
    oval.position = CGPoint(x: 300, y: 300)
    let path = UIBezierPath(arcCenter: CGPoint(x:50, y: 50), radius: 50, startAngle:  CGFloat(0), endAngle: CGFloat.pi*2, clockwise: true).cgPath
    oval.path = path
    //oval.fillRule = kCAFillRuleEvenOdd
    oval.fillColor = UIColor.clear.cgColor
    oval.strokeColor = frontColor.lighter(amount: 0.4).cgColor
    oval.lineCap = kCALineCapRound
    oval.lineWidth = 2
    /// shadow
    let shadowPath = UIBezierPath(arcCenter: CGPoint(x:50, y: 50), radius: outerShadowRadius, startAngle:  CGFloat(0), endAngle: CGFloat.pi*2, clockwise: true).cgPath
    oval.shadowPath = shadowPath
    oval.shadowColor = backColor.cgColor
    oval.shadowOpacity = 1
    oval.shadowRadius = 10
    oval.shadowOffset = CGSize.zero
    
    // sub shadow layer
    let subLayer = CALayer()
    subLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    subLayer.bounds = CGRect(x: 0, y: 0, width: 90, height: 90)
    subLayer.position = CGPoint(x: 50, y: 50)
    /// shadow
    let subShadowPath = UIBezierPath(arcCenter: CGPoint(x:45, y: 45), radius: subShadowRadius, startAngle:  CGFloat(0), endAngle: CGFloat.pi*2, clockwise: true).cgPath
    subLayer.shadowPath = subShadowPath
    subLayer.shadowColor = backgroundColor.cgColor
    subLayer.shadowOpacity = 1
    subLayer.shadowRadius = subShadowShadowRadius
    subLayer.shadowOffset = CGSize.zero
    oval.addSublayer(subLayer)
    
    return oval
}


