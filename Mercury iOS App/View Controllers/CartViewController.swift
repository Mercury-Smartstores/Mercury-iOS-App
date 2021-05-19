import UIKit
import SocketIO
import SwiftUI

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTitleTextField: UITextField!
    @IBOutlet weak var cartTableView: UITableView!
    var items: [Item] = [] // Items are unique according to Mercury specifications
    var client: Client = Client.shared
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        loadObservers()
    }
    
    func setUpElements() {
        if client.socket.status == SocketIOStatus.connected || client.socket.status == SocketIOStatus.connecting {
            warningLabel.alpha = 0
            cartTableView.alpha = 1
        } else {
            warningLabel.alpha = 1
            cartTableView.alpha = 0
        }
        cartTitleTextField.textColor = .white
        cartTitleTextField.backgroundColor = .clear
        cartTitleTextField.isUserInteractionEnabled = false
        warningLabel.center = self.view.center
    }
    
    func loadObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.clientEnteredShop), name: NSNotification.Name(rawValue: Constants.Notifications.clientEnteredShop), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.addItemToCart), name: NSNotification.Name(rawValue: Constants.Notifications.addItemToCart), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeItemFromCart), name: NSNotification.Name(rawValue: Constants.Notifications.removeItemFromCart), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.clientExitedShop), name: NSNotification.Name(rawValue: Constants.Notifications.clientExit), object: nil)
    }
    
    @objc func clientExitedShop(_ notification: NSNotification) {
        warningLabel.alpha = 1
        cartTableView.alpha = 0
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.ViewControllersIds.ticketResumeViewController) as? TicketResumeViewController
        vc!.items = items
        self.present(vc!, animated: true)
        items = []
        cartTableView.reloadData()
    }
    
    @objc func clientEnteredShop(_ notification: NSNotification) {
        warningLabel.alpha = 0
        cartTableView.alpha = 1
    }
    
    @objc func addItemToCart(_ notification: NSNotification) {
        if let item = notification.userInfo?["item"] as? Item {
            if !items.contains(item) {
                items.append(item)
                cartTableView.reloadData()
            }
        }
    }
    
    @objc func removeItemFromCart(_ notification: NSNotification) {
        if let item = notification.userInfo?["item"] as? Item {
            items.removeAll{$0 == item}
            cartTableView.reloadData()
        }
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.cartTableViewCell) as! CartTableViewCell
        let item = items[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}

