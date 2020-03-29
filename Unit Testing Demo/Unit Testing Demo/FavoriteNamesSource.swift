// Copyright © 2020 CapTech. All rights reserved.

import Foundation

class FavoriteNamesSource {
    var list: [Favoritable<String>]
    var favorites: [Favoritable<String>] { list.filter { $0.isFavorite }}

    init(dataLoader: StringListLoader = FileListLoader(fileName: "DogNames", fileType: ".txt")) {
        self.list = dataLoader.load().map({ Favoritable(item: $0) })
    }
}
