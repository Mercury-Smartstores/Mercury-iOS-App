import UIKit

class TicketsViewController: UIViewController {
    @IBOutlet weak var ticketsTitleTextField: UITextField!
    @IBOutlet weak var ticketsTableView: UITableView!
    var tickets: [Ticket] = []
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateFormatter.dateStyle = .short
        setUpElements()
        tickets = fetchData()
        //configureTableView()
    }
    
    func setUpElements() {
        ticketsTitleTextField.backgroundColor = .clear
        ticketsTitleTextField.textColor = .white
        ticketsTitleTextField.isUserInteractionEnabled = false
    }
    
    func fetchData() -> [Ticket] {
        let ticket1 = Ticket(date: Date(timeIntervalSinceReferenceDate: 123456789.0), items: [Item(image: UIImage(named: "watermelon.png")!, name: "Watermelon", price: 1.45)]) // Since 2001
        let ticket2 = Ticket(date: Date(timeIntervalSinceReferenceDate: -987654321.0), items: [Item(image: UIImage(named: "milk.png")!, name: "Milk", price: 0.99)])
        return [ticket1, ticket2]
    }
    
}

extension TicketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.customItemCell) as! CustomTableViewCell
        let ticket = tickets[indexPath.row]
        var total: Double = 0
        ticket.items.forEach({ item in
            total += item.price
        })
        cell.set(item: Item(image: UIImage(named: "receipt-approved.png")!, name: "Ticket from " + dateFormatter.string(from: ticket.date), price: total))
        return cell
    }
    
}
