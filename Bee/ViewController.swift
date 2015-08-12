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
      |> skip(1) // Skip first
      |> map { text in text as! String }
      |> map { text in Bee.spell(text) }
      |> throttle(0.5, onScheduler: QueueScheduler.mainQueueScheduler)
    
    input.start(next: { text in
      self.display.text = text
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

