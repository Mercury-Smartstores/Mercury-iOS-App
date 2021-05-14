import Foundation
import SocketIO

class Client {
    private var socketManager = SocketManager(socketURL: URL(string: Constants.Network.serverUrl)!, config: [.log(true), .compress])
    var socket : SocketIO.SocketIOClient
    var messages = [String]()
    var cartItems = [String]()
    
    init() {
        socket = socketManager.defaultSocket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected!")
        }
        socket.on("new item") { [weak self] (data, ack) in
            if let data = data[0] as? [String: String], let item = data["name"], let _ = data["price"] {
                print(data)
                DispatchQueue.main.async {
                    self?.cartItems.append(item)
                }
            }
        }
    }
    
    static let shared = Client()
}

