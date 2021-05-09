import Foundation
import SocketIO

final class Client: ObservableObject {
    private var socketManager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    @Published var socket : SocketIO.SocketIOClient
    @Published var messages = [String]()
    @Published var cartItems = [String]()
    
    init() {
        socket = socketManager.defaultSocket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected!")
            self.socket.emit("connection", "Client connected")
        }
        socket.on("new item") { [weak self] (data, ack) in
            if let data = data[0] as? [String: String], let item = data["name"], let _ = data["price"] {
                print(data)
                DispatchQueue.main.async {
                    self?.cartItems.append(item)
                }
            }
        }
        socket.connect()
    }
}

