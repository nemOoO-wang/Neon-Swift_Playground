import Foundation
import PlaygroundSupport
import UIKit
import QuartzCore
import AVFoundation



/*: neon dance
 # 🤩Let's begin!
 ### The music and the dancing-book would auto start,you could follow the demoDancingBook to create your own dancing book like me! I provide 8 kinds of neon and 11 types of neon animation. You can easily adjust them after checking the NeonGenerator.swift and the NeonAnimations.swift. Because they are totally created by Swift!
 ## Neon Lights Without even one picture!
 Crazy, right? Why hesitate? Make a Neon-Dancing-Book youself now!😎
 
 - Important:
 This demo takes about 2 minutes to play, I've burried some Easter-eggs for you, please watch the whole dancing-book, and try to find them out!
 # 🧐
 
 */

/*:
 ### Here are the neon colors used to render Neon Lights, change them with double click, and create a different feeling~
  ![colors](Colors.png)
 */
let boardColors = [#colorLiteral(red: 1, green: 0.2681740344, blue: 0.1958035976, alpha: 1), #colorLiteral(red: 0.9025816942, green: 0.9025512996, blue: 0.2472696003, alpha: 1), #colorLiteral(red: 0.6336437361, green: 0.8903672272, blue: 0.4604207523, alpha: 1), #colorLiteral(red: 1, green: 0.583850059, blue: 0.724180476, alpha: 1), #colorLiteral(red: 0.8169697786, green: 0.6903436435, blue: 1, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.4242472921, green: 0.5267455537, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5304031388, blue: 0.3329952343, alpha: 1)]
let colorPairs = [[#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)], [#colorLiteral(red: 0.5473457531, green: 0.981599467, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.9109785091, blue: 0.9283589784, alpha: 1)], [#colorLiteral(red: 0.5999724541, green: 0.6880562816, blue: 1, alpha: 1),#colorLiteral(red: 0.3505807793, green: 0.4425384426, blue: 0.9764705896, alpha: 1)], [#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)], [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)], [#colorLiteral(red: 1, green: 0.6731340306, blue: 0.7571223992, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)], [#colorLiteral(red: 0.7560469665, green: 0.6728259933, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)], [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.2681740344, blue: 0.1958035976, alpha: 1)]]
let gradientCGColors = [#colorLiteral(red: 0.6336437361, green: 0.8903672272, blue: 0.4604207523, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor, #colorLiteral(red: 0.8169697786, green: 0.6903436435, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.4242472921, green: 0.5267455537, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.583850059, blue: 0.724180476, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.2770538005, blue: 0.4478188362, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.5304031388, blue: 0.3329952343, alpha: 1).cgColor, #colorLiteral(red: 0.9857871472, green: 1, blue: 0.5680258266, alpha: 1).cgColor, #colorLiteral(red: 0.3554704732, green: 0.8420843909, blue: 0.6351748796, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor]

/*:
 ### Here is the dancing book I created for demo, you can change the music play by edit the Config.swift file, and create your own dancing-book with my guide below 😝
 
 ![counts](Counts.png)
 */
let dancingBook =
    [
        20:CapsuleBoard.init("Neon", with: boardColors[0], clickwise: 0),
        68:CapsuleBoard.init("By Nemo", with: boardColors[0], clickwise: 0),
        // change backgroundView color
        90:NeonAnimation.init(),
        112:CapsuleBoardApple.init("The  Art", with: colorPairs[7], clickwise: 1, flashSpeed: 0),
        158:CapsuleBoardApple.init("of  light", with: colorPairs[7], clickwise: 1, flashSpeed: 1),
        204:CapsuleBoardApple.init("The  light", with: colorPairs[7], clickwise: 1, flashSpeed: 2),
        250:CapsuleBoardApple.init("of  God!", with: colorPairs[7], clickwise: 1, flashSpeed: 4),
        // break point 1
        262:HollowText.init(text: "——Neon——", with: colorPairs[0], asType: .circle),
        272:HollowText.init(text: "——Neon——", with: colorPairs[1], asType: .circle),
        282:HollowText.init(text: "——Neon——", with: colorPairs[2], asType: .circle),
        292:HollowText.init(text: "——Neon——", with: colorPairs[3], asType: .circle),
        302:HollowText.init(text: "——Neon——", with: colorPairs[4], asType: .circle),
        314:HollowText.init(text: "——Neon——", with: colorPairs[5], asType: .circle),
        326:HollowText.init(text: "——Neon——", with: colorPairs[6], asType: .circle),
        // break point 2
        // 在此添加背景特效！！！！(7)
        360:CapsuleBoard.init("🤨", with: boardColors[1], clickwise: 0),
        372:CapsuleBoard.init("😋", with: boardColors[2], clickwise: 0),
        384:CapsuleBoard.init("🤩", with: boardColors[3], clickwise: 0),
        396:CapsuleBoard.init("😁", with: boardColors[4], clickwise: 0),
        408:CapsuleBoard.init("😆", with: boardColors[5], clickwise: 0),
        418:CapsuleBoard.init("The", with: boardColors[6], clickwise: 0),
        428:CapsuleBoard.init("Big Thing", with: boardColors[0], clickwise: 0),
        440:CapsuleBoard.init("is Coming!", with: boardColors[4], clickwise: 0),
        // ovals
        ///14
        450:OvalCollect.init(with: colorPairs[0], inWhite: 0),
        464:OvalCollect.init(with: colorPairs[0], inWhite: 0),
        478:OvalCollect.init(with: colorPairs[0], inWhite: 0),
        ///12
        490:OvalCollect.init(with: colorPairs[0], inWhite: 0),
        502:OvalCollect.init(with: colorPairs[1], inWhite: 0),
        512:OvalCollect.init(with: colorPairs[5], inWhite: 0),
        ///10
        522:OvalCollect.init(with: colorPairs[2], inWhite: 0),
        532:OvalCollect.init(with: colorPairs[3], inWhite: 0),
        542:OvalCollect.init(with: colorPairs[4], inWhite: 0),
        ///8
        550:OvalCollect.init(with: colorPairs[5], inWhite: 0),
        558:OvalCollect.init(with: colorPairs[6], inWhite: 0),
        566:OvalCollect.init(with: colorPairs[2], inWhite: 0),
        574:OvalCollect.init(with: colorPairs[5], inWhite: 0),
        582:OvalCollect.init(with: colorPairs[0], inWhite: 0),
        ///6
        588:OvalCollect.init(with: colorPairs[4], inWhite: 0),
        594:OvalCollect.init(with: colorPairs[5], inWhite: 0),
        600:OvalCollect.init(with: colorPairs[1], inWhite: 0),
        606:OvalCollect.init(with: colorPairs[0], inWhite: 0),
        ///4
        610:OvalCollect.init(with: colorPairs[1], inWhite: 0),
        614:OvalCollect.init(with: colorPairs[2], inWhite: 0),
        616:OvalCollect.init(with: colorPairs[3], inWhite: 0),
        // background white!
        618:CircleExpand.init(),
        620:NeonAnimation.init(UIColor.white),
        636:AppleShow.init(),
        // circle bound
        650: CircleBound.init(with: colorPairs[0]),
        672: CircleBound.init(with: colorPairs[1]),
        694: CircleBound.init(with: colorPairs[2]),
        716: CircleBound.init(with: colorPairs[5]),
        // make come change?
        738: CapsuleBoard.init("One", with: boardColors[4], clickwise: 0),
        760: CapsuleBoard.init("More", with: boardColors[3], clickwise: 1),
        782: CapsuleBoard.init("Thing!", with: boardColors[0], clickwise: 0),
        // gradient animation
        814: GradientMove(),
        812: AppleShowAndStay(),
        832: GradientMove.init(to: true),
        856: GradientMove.init(to: true),
        878: GradientMove.init(to: true),
        900: GradientMove.init(to: true),
        920: AppleShowAndStay(),
        922: GradientMove.init(to: true),
        926: AppleShowAndStay(),
        944: GradientMove.init(to: true),
        966: GradientMove.init(to: true),
        988: GradientMove.init(to: true),
        1000: AppleShowAndStay(),
        1012: HollowText.init(text: "To the people\nI love", with: colorPairs[0], asType: .roundRect),
        1036: HollowText.init(text: "For the future\nwe make", with: colorPairs[2], asType: .roundRect),
        1062: HollowText.init(text: "Hope you'll\nlike it~", with: colorPairs[5], asType: .roundRect),
        1088: HollowText.init(text: "Thank you\nfor watching!", with: colorPairs[3], asType: .roundRect),
        1100: AppleShowAndStay(),
        1110: EndNeon()
]

/*: Instruction
 ## Here is a instruction to create your own neon-dancing-book:
 * The dancing-book is simply an array that holds 'Int' values as keys and 'NeonAnimation'(or its sub class) instance as values;
 * The key must be a positive even 'Int' value, and every 2 added means a 0.2 seconds have passed;
 * There are 11 NeonAnimation that you could create! You can check the code in the 'NeonAnimations.swift' file to find more details🤔
 - Note:
 The instruction_dancing_book bellow means that the background color change to pink at 0.2 seconds, and a beautiful neon text would animate out at 2.2 seconds.
 */
let instruction_dancing_book =
[
    2: NeonAnimation.init(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
    22: HollowText.init(text: "hello world!", with: [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)], asType: .circle)
]












var player = AVAudioPlayer()
let Screensize = Nemo.SCREENSIZE
let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: Screensize, height: Screensize))
backgroundView.layer.backgroundColor = UIColor.white.cgColor
var handler = NMHandler()
handler.startPlay(inView: backgroundView, with: dancingBook, by: &player)
PlaygroundPage.current.liveView = backgroundView
