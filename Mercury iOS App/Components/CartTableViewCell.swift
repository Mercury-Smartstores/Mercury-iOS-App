import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    
    func set(item: Item) {
        imageViewCell.image = item.image
        nameCell.text = item.name
        priceCell.text = "$" + String(item.price)
    }

}
