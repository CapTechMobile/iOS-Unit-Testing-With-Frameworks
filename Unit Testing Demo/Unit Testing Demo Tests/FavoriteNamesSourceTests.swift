// Copyright © 2020 CapTech. All rights reserved.

import XCTest
@testable import Unit_Testing_Demo

class FavoriteNamesSourceTests: XCTestCase {

    func testListsAll() {
        let sut = makeSUT()

        let items = sut.currentList.map({ $0.item })
        XCTAssertEqual(TestLoader().load(), items)
    }

    func testListsFavorites() {
        let sut = makeSUT()
        sut.currentList.first?.isFavorite.toggle()
        sut.isFavoritesSelected = true

        XCTAssertEqual(TestLoader().load().first, sut.currentList.first?.item)
    }

    func testToggleUnfavorited_AddsToFavorites() {
        let sut = makeSUT()

        sut.toggleFavorite(at: 0)

        XCTAssert(sut.currentList.first?.isFavorite == true)
    }

    func testToggleFavorited_RemovesFromFavorites() {
        let sut = makeSUT()
        sut.currentList.first?.isFavorite = true

        sut.toggleFavorite(at: 0)
        sut.isFavoritesSelected = true

        XCTAssertTrue(sut.currentList.isEmpty)
    }

    func testToggleOutOfBounds_DoesNotChangeList() {
        let sut = makeSUT()

        sut.toggleFavorite(at: sut.currentList.count)
        sut.isFavoritesSelected = true

        XCTAssert(sut.currentList.isEmpty)
    }

    func makeSUT() -> FavoriteNamesSource {
        return FavoriteNamesSource(dataLoader: TestLoader())
    }

}


fileprivate class TestLoader: StringListLoader {

    func load() -> [String] {
        return ["This", "Is", "A", "Test"]
    }

}
