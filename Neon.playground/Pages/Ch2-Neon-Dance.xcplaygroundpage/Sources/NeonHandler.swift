import Foundation
import UIKit
import AVFoundation

/* Usage:
 
 var player = AVAudioPlayer()
 var handler = NMHandler()
 handler.startPlay(inView: bg, with: dancingBook, by: &player)
 
 */

/**
 Animation Type
 
 ## Choose an animation type you like
 
 - Author: nemOoO
 */
public enum NeonAnimationType {
    case bgColor,capsuleBoard,capsuleBoardApple,circle,ovalCollect,circleExpand,appleShow,appleShowAndStay,gradientMove,hollowText,endNeon
}

// base class
/**
 Neon Animation Base Class
 
 ## init to get a basic neon animation
 
 - Author:
 nemOoO
 */
public class NeonAnimation{
    public var type: NeonAnimationType
    public var string: String
    public var baseColor: UIColor
    public var colorPair: Array<UIColor>
    public var optionalSwitch: Int
    public var optionalSwitch2: Int
    public init() {
        type = .bgColor
        string = ""
        baseColor = UIColor.black
        colorPair = [#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)]
        optionalSwitch = 0
        optionalSwitch2 = 0
    }
    
    /**
     Neon Animation Base Class
     
     ## init to change background color
     
     - parameters:
        - backgroundColor
     
     - Author:
     nemOoO
     */
    public init(_ backgroundColor:UIColor){
        type = .bgColor
        string = ""
        baseColor = backgroundColor
        colorPair = [#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)]
        optionalSwitch = 0
        optionalSwitch2 = 0
    }
}

// board class
public class CapsuleBoard: NeonAnimation{
    /**
     Neon Board Animation
     
     - parameters:
        - string: string to shown
        - baseColor: the base color
        - onIs1: pass 1 to make rotation clickwise
     
     - Author:
     nemOoO
     */
    public init(_ string:String, with baseColor:UIColor, clickwise onIs1:Int){
        super.init()
        self.type = .capsuleBoard
        self.string = string
        self.baseColor = baseColor
        self.optionalSwitch = onIs1
    }
}


// board apple class
public class CapsuleBoardApple: NeonAnimation{
    
    /**
     Neon Board Animation with  icon
     
     - parameters:
        - string: string to shown
        - baseColor: the base color
        - onIs1: pass 1 to make rotation clickwise
        - flashSpeed: the  flash speed
     
     - Author:
     nemOoO
     */
    public init(_ string:String, with colorPair:Array<UIColor>, clickwise onIs1:Int, flashSpeed:Int){
        super.init()
        self.type = .capsuleBoardApple
        self.string = string
        self.colorPair = colorPair
        self.optionalSwitch = onIs1
        self.optionalSwitch2 = flashSpeed
    }
}



// circle class
public class CircleBound: NeonAnimation{
    /**
     Neon Circle Bound out!
     
     - parameters:
        - colorPair: a 2-colors array
     
     - Author:
     nemOoO
     */
    public init(with colorPair: Array<UIColor>){
        super.init()
        self.type = .circle
        self.colorPair = colorPair
    }
}



// oval class
public class OvalCollect: NeonAnimation{
    /**
     Neon Oval Bound out!
     
     - parameters:
        - colorPair: a 2-colors array
        - isIn: 1 if in white background, 0 if in black background
     
     - Author:
     nemOoO
     */
    public init(with colorPair: Array<UIColor>, inWhite isIn: Int){
        super.init()
        self.type = .ovalCollect
        self.colorPair = colorPair
        self.optionalSwitch = isIn
    }
}

// circle expand class
public class CircleExpand: NeonAnimation{
    /**
     Neon Circle Expanding
     
     - Author:
     nemOoO
     */
    public override init() {
        super.init()
        self.type = .circleExpand
    }
}

// appleShow class
public class AppleShow: NeonAnimation{
    /**
     An '' bounding in the center
     
     - Author:
     nemOoO
     */
    public override init() {
        super.init()
        self.type = .appleShow
    }
}

// apple show and stay
public class AppleShowAndStay: NeonAnimation{
    /**
     An '' keep bounding in the center
     
     - Author:
     nemOoO
     */
    public override init() {
        super.init()
        self.type = .appleShowAndStay
    }
}

// gradient move
public class GradientMove: NeonAnimation{
    /**
     init a beautiful and animating gradient background
     
     - Author:
     nemOoO
     */
    public override init() {
        super.init()
        self.type = .gradientMove
    }
    
    /**
     skip to the next color
     
     - Author:
     nemOoO
     */
    public init(to next: Bool){
        super.init()
        self.type = .gradientMove
        if next == false {
            self.optionalSwitch = 1
        }else{
            self.optionalSwitch = 0
        }
    }
}


// Hollow Text
public class HollowText: NeonAnimation{
    /**
     beautiful hollow neon text
     
     - parameters:
        - text: text that shown
        - colorPair: a 2-colors array
     
     - Author:
     nemOoO
     */
    public init(text:String, with colorPair:[UIColor], asType type:HollowNeonTextType){
        super.init()
        self.type = .hollowText
        self.string = text
        self.colorPair = colorPair
        self.optionalSwitch = type.rawValue
    }
}


// End Neon
public class EndNeon: NeonAnimation{
    public override init() {
        super.init()
        self.type = .endNeon
    }
}


// AV Controller
@objcMembers public class NMHandler: NSObject{
    
    dynamic var currentTime: Int = -2
    var backgroundView: UIView
    var dancingBook: [Int: NeonAnimation]
    var gradientLayer: CAGradientLayer?
    var appleStayLayer: CATextLayer?
    
    public override init() {
        backgroundView = UIView()
        dancingBook = [-1000: NeonAnimation()]
        super.init()
    }
    
    public func startPlay(inView view:UIView, with dancingBook:[Int: NeonAnimation], by player: inout AVAudioPlayer) -> Void {
        // settings
        backgroundView = view
        self.dancingBook = dancingBook
        let musicName = Nemo.MusicName
        let musicType = Nemo.MusicType
        // init AVAudio
        let path = Bundle.main.path(forResource: musicName, ofType: musicType)
        let fileUrl = NSURL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: fileUrl as URL)
            player.play()
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(aniFunc), userInfo: nil, repeats: true)
        }catch _{
            print("failed to load music!")
        }
    }
    
    @objc func aniFunc() -> Void {
        currentTime += 2
        print(currentTime)
        let animation = dancingBook[currentTime]
        if (animation != nil) {
            switch animation?.type {
            case .bgColor?:
                UIView.animate(withDuration: 0.5, animations: {
                    self.backgroundView.backgroundColor = animation?.baseColor
                })
                
            case .capsuleBoard?:
                let baseLayer = showNeonBoard(text: (animation?.string)!, with: (animation?.baseColor)!, clickwise: (animation?.optionalSwitch)!)
                backgroundView.layer.addSublayer(baseLayer)
                
            case .capsuleBoardApple?:
                let boardLayer = showAppleNeonBoard(text: (animation?.string)!, with: (animation?.colorPair)!, clickwise: (animation?.optionalSwitch)!, flashSpeed: (animation?.optionalSwitch2)!)
                backgroundView.layer.addSublayer(boardLayer)
                
            case .ovalCollect?:
                var token = false
                if animation?.optionalSwitch == 1 {
                    token = true
                }
                let oval = ovalCollecting(colorPair: (animation?.colorPair)!, inWhiteBack: token)
                backgroundView.layer.insertSublayer(oval, at: 0)
                
            case .circleExpand?:
                let circle = CircleExpanding()
                backgroundView.layer.insertSublayer(circle, at: 0)
                
            case .appleShow?:
                let apple = appleShowing()
                backgroundView.layer.addSublayer(apple)
                
            case .circle?:
                let circleLayer = circleBounding(with: (animation?.colorPair)!)
                backgroundView.layer.addSublayer(circleLayer)
                
            case .gradientMove?:
                if self.gradientLayer == nil {
                    self.gradientLayer = gradientInitiate()
                    backgroundView.layer.insertSublayer(gradientLayer!, at: 0)
                }else{
                    let next = (animation?.optionalSwitch)! == 0 ? true : false
                    gradientMoving(to: next, on: gradientLayer!)
                }
                
            case .hollowText?:
                let result = HollowShowing(with: (animation?.string)!, inColors: (animation?.colorPair)!, asType: HollowNeonTextType(rawValue: (animation?.optionalSwitch)!)!)
                backgroundView.layer.addSublayer(result.containerLayer)
                
            case .appleShowAndStay?:
                if self.appleStayLayer == nil {
                    self.appleStayLayer = appleShowAndStaying()
                    backgroundView.layer.addSublayer(appleStayLayer!)
                }else{
                    removeAppleLayer()
                }
                
            case .endNeon?:
                let container = NeonShaking()
                backgroundView.layer.addSublayer(container)
                
            default:
                print("Wrong Type!")
            }
        }
    }
    
    func removeAppleLayer(){
        let fadeAppleAni = CABasicAnimation(keyPath: "opacity")
        fadeAppleAni.fromValue = 1
        fadeAppleAni.toValue = 0
        fadeAppleAni.duration = 1.0
        appleStayLayer?.add(fadeAppleAni, forKey: "fadeApple")
        let tmpLayer = self.appleStayLayer
        self.appleStayLayer = nil
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.9, execute: {
            tmpLayer?.removeFromSuperlayer()
        })
    }
}

