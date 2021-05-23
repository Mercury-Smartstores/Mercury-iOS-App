import Foundation

final class FileUtils {
    
    static func writeToMp4File(data: Data, fileName: String) -> String {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            return ""
        }

        let fileurl =  directory.appendingPathComponent("\(fileName).mp4")
        if FileManager.default.fileExists(atPath: fileurl.path) {
            if let fileHandle = FileHandle(forWritingAtPath: fileurl.path) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            }
            else {
                print("Can't open file to write.")
            }
        }
        else {
            do {
                try data.write(to: fileurl, options: .atomic)
            } catch {
                print("Unable to write in new file.")
            }
        }
        return fileurl.absoluteString
    }
    
}
