import UIKit
import SocketIO
import SwiftUI

class CartViewController: UIViewController {

    @IBOutlet weak var cartTitleTextField: UITextField!
    @IBOutlet weak var cartTableView: UITableView!
    var items: [Item] = [] // Items are unique according to Mercury specifications
    var client: Client = Client.shared
    @IBOutlet weak var testButtonRequest: UIBarButtonItem!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showShoppingCart), name: NSNotification.Name(rawValue: Constants.Notifications.clientEnteredShop), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.addItemToCart), name: NSNotification.Name(rawValue: Constants.Notifications.addItemToCart), object: nil)
    }
    
    func setUpElements() {
        cartTableView.alpha = 0
        cartTitleTextField.textColor = .white
        cartTitleTextField.backgroundColor = .clear
        cartTitleTextField.isUserInteractionEnabled = false
        warningLabel.center = self.view.center
    }
    
    @objc func showShoppingCart() {
        warningLabel.alpha = 0
        cartTableView.alpha = 1
    }
    
    @objc func addItemToCart(_ notification: NSNotification) {
        if let item = notification.userInfo?["item"] as? Item {
            items.append(item)
            cartTableView.reloadData()
        }
    }
    
    @IBAction func clickRequestItem(_ sender: Any) { // Remove when Store Manager is done
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

