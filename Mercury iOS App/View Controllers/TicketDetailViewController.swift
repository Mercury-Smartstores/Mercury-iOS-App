import UIKit

class TicketDetailViewController: UIViewController {
    @IBOutlet var ticketTableView: UITableView!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    var ticket: Ticket?
    let dateFormatter = DateFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dateFormatter.dateStyle = .short
        titleNavigationItem.title = "Ticket detail (" + dateFormatter.string(from: ticket!.date) + ")"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
}

extension TicketDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticket!.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.ticketDetailTableViewCell) as! TicketDetailTableViewCell
        let item = ticket!.items[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}
