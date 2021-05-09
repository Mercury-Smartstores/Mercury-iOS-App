import UIKit

class CartItemCell: UITableViewCell {
    
    var itemImageView = UIImageView()
    var itemNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemImageView)
        addSubview(itemNameLabel)
        
        configureItemImageView()
        configureItemNameLabel()
        setItemImageViewConstraints()
        setItemNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(item: Item) {
        itemImageView.image = item.image
        itemNameLabel.text = item.name
    }
    
    func configureItemImageView() {
        itemImageView.layer.cornerRadius = 10
        itemImageView.clipsToBounds = true
    }
    
    func configureItemNameLabel() {
        itemNameLabel.numberOfLines = 0
        itemNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setItemImageViewConstraints() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setItemNameLabelConstraints() {
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        itemNameLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20).isActive = true
        itemNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        itemNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
