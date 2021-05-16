import Foundation
import SocketIO

class Client: ObservableObject {
    private var socketManager = SocketManager(socketURL: URL(string: Constants.Network.serverUrl)!, config: [.log(true), .compress])
    var socket : SocketIO.SocketIOClient
    @Published var cartItems: [Item] = [Item]()
        
    init() {
        socket = socketManager.defaultSocket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected!")
        }
        socket.on("new item") { [weak self] (data, ack) in
            if let data = data[0] as? [String: String], let name = data["name"], let price = data["price"], let image = data["image"]  {
                let dataDecoded : Data = Data(base64Encoded: image, options: .ignoreUnknownCharacters)!
                DispatchQueue.main.async {
                    self?.cartItems.append(Item(image: UIImage(data: dataDecoded)!, name: name, price: Double(price)!))                    
                }
            }
            
        }
    }
    
    static let shared = Client()
}

