import UIKit
import AVKit

class TicketResumeViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var items: [Item] = []
    let dateFormatter: DateFormatter = DateFormatter()
    @IBOutlet weak var emptyCartLabel: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    var videoPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        configureTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.explanationButtonTapped), name: NSNotification.Name(rawValue: Constants.Notifications.explanationRequest), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayExplanationVideo), name: NSNotification.Name(rawValue: Constants.Notifications.displayExplanationVideo), object: nil)
        videoPlaying = false
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
    
    override func viewDidDisappear(_ animated: Bool) {
        if !videoPlaying {
            items = []
            itemsTableView.reloadData()
            Client.shared.socket.disconnect()
        }
    }
    
    @objc func explanationButtonTapped(notification: Notification) {
        if let cell = notification.userInfo?["cell"] as? TicketResumeTableViewCell {
            let indexPath = itemsTableView.indexPath(for: cell)
            let item = items[indexPath!.row]
            Client.shared.socket.emit("request explanation", ["name": item.name, "price": item.price])
        }
    }
    
    @objc func displayExplanationVideo(notification: Notification) {
        videoPlaying = true
        let url = notification.userInfo!["url"] as! String
        let index = url.index(url.endIndex, offsetBy: -(url.count - 6))
        let player = AVPlayer(url: URL(fileURLWithPath: String(url[index...])))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
}

extension TicketResumeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewsIds.ticketResumeTableViewCell) as! TicketResumeTableViewCell
        let item = items[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}
