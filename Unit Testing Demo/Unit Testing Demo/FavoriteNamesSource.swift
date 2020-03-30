// Copyright © 2020 CapTech. All rights reserved.

import Foundation

class FavoriteNamesSource {
    private var list: [Favoritable<String>]
    private var favorites: [Favoritable<String>] { list.filter { $0.isFavorite }}
    var isFavoritesSelected: Bool = false
    var source: [Favoritable<String>] { isFavoritesSelected ? favorites : list }

    init(dataLoader: StringListLoader = FileListLoader(fileName: "DogNames", fileType: ".txt")) {
        self.list = dataLoader.load().map({ Favoritable(item: $0) })
    }

    func toggleFavorite(at index: Int) {
        guard source.indices.contains(index) else { return }
        source[index].isFavorite.toggle()
    }
}
