import UIKit
import SocketIO
import SwiftUI

class CartViewController: UIViewController {

    @IBOutlet weak var cartTitleTextField: UITextField!
    @IBOutlet weak var cartTableView: UITableView!
    var items: [Item] = []
    @ObservedObject var client: Client = Client.shared
    @IBOutlet weak var testButtonRequest: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        items = fetchData()
    }
    
    func setUpElements() {
        cartTitleTextField.textColor = .white
        cartTitleTextField.backgroundColor = .clear
        cartTitleTextField.isUserInteractionEnabled = false
    }
    
    func fetchData() -> [Item] {
        let item1 = Item(image: UIImage(named: "watermelon.png")!, name: "Watermelon", price: 1.45)
        let item2 = Item(image: UIImage(named: "milk.png")!, name: "Milk", price: 0.99)
        return [item1, item2]
    }
    
    @IBAction func clickRequestItem(_ sender: Any) {
        client.socket.emit("send item", "")
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.customItemCell) as! CustomTableViewCell
        let item = items[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}

