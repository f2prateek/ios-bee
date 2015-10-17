import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

  @IBOutlet weak var editor: UITextField!
  @IBOutlet weak var display: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let input = editor
    .rac_textSignal()
    .toSignalProducer()
        |> skip(1) // Skip first empty string ""
        |> map {
            text in text as! String
        }
        |> map { text in
            return self.trim(text)
        }
        |> throttle(0.5, onScheduler: QueueScheduler.mainQueueScheduler)
        |> observeOn(UIScheduler())
        |> start { text in
            self.display.text = Bee.spell(text)
        }
  }

  private func trim(text: String) -> String {
    return text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
  }
}

