// Copyright © 2020 CapTech. All rights reserved.

import Foundation

public protocol StringListLoader {
    func load() -> [String]
}

public class FileListLoader: StringListLoader {
    private let fileURL: URL?

    public init(fileName: String, fileType: String) {
        fileURL = Bundle.main.url(forResource: fileName, withExtension: fileType)
    }

    public func load() -> [String] {
        guard let fileURL = fileURL else { return [] }

        do {
            let text = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
            let range = NSRange(text.startIndex..., in: text)
            let regex = try NSRegularExpression(pattern: ".+")
            let results = regex.matches(in: text, range: range)

            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

}
