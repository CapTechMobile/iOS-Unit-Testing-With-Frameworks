// Copyright © 2020 CapTech. All rights reserved.

import Foundation

public class Favoritable<T> {
    public let item: T
    public var isFavorite: Bool = false

    init(item: T) {
        self.item = item
    }
}
