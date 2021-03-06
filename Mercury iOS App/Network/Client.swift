import Foundation
import SocketIO

class Client {
    private var socketManager = SocketManager(socketURL: URL(string: Constants.Network.serverUrl)!, config: [.log(true), .compress])
    var socket : SocketIO.SocketIOClient
    
    init() {
        socket = socketManager.defaultSocket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected!")
        }
        socket.on("add item") { (data, ack) in
            if let data = data[0] as? [String: String], let name = data["name"], let price = data["price"], let image = data["image"] {
                let dataDecoded : Data = Data(base64Encoded: image, options: .ignoreUnknownCharacters)!
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.addItemToCart), object: nil, userInfo: ["item": Item(image: UIImage(data: dataDecoded)!, name: name, price: Double(price)!)])
            }
            
        }
        socket.on("remove item") { (data, ack) in
            if let data = data[0] as? [String: String], let name = data["name"], let price = data["price"] {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.removeItemFromCart), object: nil, userInfo: ["item": Item(image: nil, name: name, price: Double(price)!)])
            }
            
        }
        socket.on("explanation video") { (data, ack) in
            if let data = data[0] as? [String: Data], let video = data["video"] {
                let videoUrl = FileUtils.writeToMp4File(data: video, fileName: ProcessInfo.processInfo.globallyUniqueString)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.displayExplanationVideo), object: nil, userInfo: ["url": videoUrl])
            }
        }
        socket.on("exit store") { (data, ack) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.clientExit), object: nil)
        }
    }
    
    static let shared = Client()
}

