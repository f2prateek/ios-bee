import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

  @IBOutlet weak var editor: UITextField!
  @IBOutlet weak var display: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let animation = CATransition()
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    animation.type = kCATransitionFade
    animation.duration = 0.5

    let input = editor
        .rac_textSignal()
        .toSignalProducer()
        |> skip(1) // Skip first empty string ""
        |> map { text in text as! String }
        |> map { text in return text.trim() }
        |> throttle(0.5, onScheduler: QueueScheduler.mainQueueScheduler)
        |> observeOn(UIScheduler())
        |> start { text in
            self.display.layer.addAnimation(animation, forKey:"kCATransitionFade")
            self.display.text = Bee.spell(text)
        }
  }
}
