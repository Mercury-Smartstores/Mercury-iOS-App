import UIKit

class TicketDetailViewController: UIViewController {
    @IBOutlet var ticketTableView: UITableView!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleNavigationItem.title = "Ticket detail"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

}


extension TicketDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
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
