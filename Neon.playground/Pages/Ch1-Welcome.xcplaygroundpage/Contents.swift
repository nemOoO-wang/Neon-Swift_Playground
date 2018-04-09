import Foundation
import PlaygroundSupport
import UIKit
import AVFoundation

/*:Welcome Page
 # Welcome to the Neon World !
 ![icon](Icon.png)
 Hey!There~ Are you ready to dip into our beautiful and funny playground?
 In this playground, you'll experense a neon-dancing demo that displays beautiful neon lights using CODE! I bet you'll crazy about that! 😆 After watch my Demo, you can easily create your own Dancing-book with any music you like.

 - Note:
 Before Start our trip, please ensure that you have put on your earphone/headphone 🎧 , and also call out the live window using 'Option+Command+Enter', resize it appropriatly to fit the assistant window.
 ### Well, the Mac-built-in speaker also works good~ But I hope you can get a better experience😋
 ### please ensure the live window size is fit well like I show below
 ### It takes a while for loading the live, please wait~~
 ![window demo](Resize.png)
 */

/*:
- Important:
There is a background music playing now, please adjust the sound to a comfortable volume. If you are ready
 [let's start our trip!!!](@next)
 */




/*:
 - Note:
 This playground works perfect with Xcode 9.3 and macOS 10.13, if it loading slow or some emoji don't rendered well please upgrade your Mac 😋
 */














// background
let SCREENSIZE = Nemo.SCREENSIZE
let background = UIView(frame: CGRect(x: 0, y: 0, width: SCREENSIZE, height: SCREENSIZE))
background.layer.backgroundColor = UIColor.white.cgColor
// gradient layer
let gradientLayer = CAGradientLayer()
addGradientLines(to: gradientLayer)
background.layer.addSublayer(gradientLayer)
// WWDC icon
iconShow(on: background)
// neon layer
let neonBaseLayer = CALayer()
addNeon(to: neonBaseLayer)
background.layer.addSublayer(neonBaseLayer)
PlaygroundPage.current.liveView = background
// BGM
var player = AVAudioPlayer()
let path = Bundle.main.path(forResource: "麗窨 - 含悦", ofType: "mp3")
let fileUrl = NSURL(fileURLWithPath: path!)
do{
    player = try AVAudioPlayer(contentsOf: fileUrl as URL)
    player.play()
}catch _{
    print("failed to load music!")
}
