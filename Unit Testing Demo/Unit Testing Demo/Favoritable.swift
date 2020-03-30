// Copyright © 2020 CapTech. All rights reserved.

import Foundation

class Favoritable<T> {
    let item: T
    var isFavorite: Bool = false

    init(item: T) {
        self.item = item
    }
}
