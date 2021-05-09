import UIKit
import SocketIO
import SwiftUI

class CartViewController: UIViewController {

    @IBOutlet weak var cartTitleTextField: UITextField!
    @ObservedObject var client = Client()
    var itemsTableView = UITableView()
    var items: [Item] = []
    @IBOutlet weak var testButtonRequest: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        //items = fetchData()
        configureTableView()
    }
    
    func setUpElements() {
        cartTitleTextField.textColor = .white
        cartTitleTextField.backgroundColor = .clear
        cartTitleTextField.isUserInteractionEnabled = false
    }
    
    func configureTableView() {
        view.addSubview(itemsTableView)
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.rowHeight = 100
        itemsTableView.isUserInteractionEnabled = false
        itemsTableView.register(CartItemCell.self, forCellReuseIdentifier: Constants.TableViewsIds.cartItemCell)
        itemsTableView.pin(to: view)
        client.cartItems.forEach { item in
            items.append(Item(image: UIImage(named: "grocery.png")!, name: item))
        }
    }
    
    func fetchData() -> [Item] {
        let item1 = Item(image: UIImage(named: "watermelon.png")!, name: "Watermelon")
        let item2 = Item(image: UIImage(named: "milk.png")!, name: "Milk")
        return [item1, item2]
    }
    
    @IBAction func clickRequestItem(_ sender: Any) {
        client.socket.emit("add item test", "")
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.cartItemCell) as! CartItemCell
        let item = items[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}

