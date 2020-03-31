// Copyright © 2020 CapTech. All rights reserved.

import Foundation

public class FavoriteNamesSource {
    private var allList: [Favoritable<String>]
    private var favoritesList: [Favoritable<String>] { allList.filter { $0.isFavorite }}
    public var isFavoritesSelected: Bool = false
    public var currentList: [Favoritable<String>] { isFavoritesSelected ? favoritesList : allList }

    public init(dataLoader: StringListLoader) {
        self.allList = dataLoader.load().map({ Favoritable(item: $0) })
    }

    public func toggleFavorite(at index: Int) {
        guard currentList.indices.contains(index) else { return }
        currentList[index].isFavorite.toggle()
    }
}
