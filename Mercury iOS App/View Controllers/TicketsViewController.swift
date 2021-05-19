import UIKit

class TicketsViewController: UIViewController {
    @IBOutlet weak var ticketsTitleTextField: UITextField!
    @IBOutlet weak var ticketsTableView: UITableView!
    var tickets: [Ticket] = []
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .short
        setUpElements()
        tickets = fetchData() // As example
    }
    
    func setUpElements() {
        ticketsTitleTextField.backgroundColor = .clear
        ticketsTitleTextField.textColor = .white
        ticketsTitleTextField.isUserInteractionEnabled = false
    }
    
    func fetchData() -> [Ticket] {
        let ticket1 = Ticket(date: Date(), items: [Item(image: UIImage(named: "orange.png")!, name: "Orange", price: 0.45), Item(image: UIImage(named: "milk.png")!, name: "Milk", price: 1.09)])
        let ticket2 = Ticket(date: Date(timeIntervalSinceReferenceDate: 123435456789.0), items: [Item(image: UIImage(named: "milk.png")!, name: "Milk", price: 1.09)])
        return [ticket1, ticket2]
    }
    
}

extension TicketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.ticketsTableViewCell) as! TicketsTableViewCell
        let ticket = tickets[indexPath.row]
        var total: Double = 0
        ticket.items.forEach({ item in
            total += item.price
        })
        cell.set(item: Item(image: UIImage(named: "receipt-approved.png")!, name: "Ticket from " + dateFormatter.string(from: ticket.date), price: total))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTicketDetail", let destinationViewController = segue.destination as? TicketDetailViewController {
            if let cell = sender as? TicketsTableViewCell, let indexPath = ticketsTableView.indexPath(for: cell) {
                destinationViewController.ticket = tickets[indexPath.row]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectionIndexPath = ticketsTableView.indexPathForSelectedRow {
            ticketsTableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
    
}
