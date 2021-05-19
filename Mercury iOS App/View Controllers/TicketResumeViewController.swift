import UIKit

class TicketResumeViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var items: [Item] = []
    let dateFormatter: DateFormatter = DateFormatter()
    @IBOutlet weak var emptyCartLabel: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        configureTableView()
    }
    
    func setUpElements() {
        view.backgroundColor = Constants.Colors.principalRedBackground
        emptyCartLabel.tintColor = Constants.Colors.principalRedBackground
        emptyCartLabel.layer.cornerRadius = 15
        emptyCartLabel.layer.masksToBounds = true
        dateFormatter.dateStyle = .short
        dateLabel.text = "Date: " + dateFormatter.string(from: Date())
        var total: Double = 0
        items.forEach({ item in
            total += item.price
        })
        totalPriceLabel.text = "Total: $" + String(total)
        if total == 0 {
            emptyCartLabel.alpha = 1
            itemsTableView.alpha = 0
            emptyCartLabel.center = view.center
        } else {
            emptyCartLabel.alpha = 0
            itemsTableView.alpha = 1
        }
    }
    
    func configureTableView() {
        itemsTableView.backgroundColor = .white
        itemsTableView.layer.cornerRadius = 10
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        items = []
        itemsTableView.reloadData()
    }
}

extension TicketResumeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.cartTableViewCell) as! CartTableViewCell // TODO: change this and create a specific one for this class
        let item = items[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}
