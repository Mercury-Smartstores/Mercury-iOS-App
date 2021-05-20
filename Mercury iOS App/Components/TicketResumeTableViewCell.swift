import UIKit

class TicketResumeTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var explanationButton: UIButton!
    
    func set(item: Item) {
        itemImage.image = item.image
        nameLabel.text = item.name
        priceLabel.text = "$" + String(item.price)
    }
    
    @IBAction func explanationRequested(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.explanationRequest), object: nil, userInfo: ["cell": self])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = .white
        }
    }
    
}
