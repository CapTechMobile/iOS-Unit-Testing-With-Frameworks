// Copyright © 2020 CapTech. All rights reserved.

import Foundation

class FavoriteNamesSource {
    private var allList: [Favoritable<String>]
    private var favoritesList: [Favoritable<String>] { allList.filter { $0.isFavorite }}
    var isFavoritesSelected: Bool = false
    var currentList: [Favoritable<String>] { isFavoritesSelected ? favoritesList : allList }

    init(dataLoader: StringListLoader) {
        self.allList = dataLoader.load().map({ Favoritable(item: $0) })
    }

    func toggleFavorite(at index: Int) {
        guard currentList.indices.contains(index) else { return }
        currentList[index].isFavorite.toggle()
    }
}
