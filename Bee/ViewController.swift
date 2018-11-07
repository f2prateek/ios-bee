import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onEditChanged(_ sender: Any) {
        label.text = Bee.spell(text: textField.text!)
    }
}
