import Foundation
import UIKit

struct Item : Equatable {
    var image: UIImage?
    var name: String
    var price: Double
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
}
