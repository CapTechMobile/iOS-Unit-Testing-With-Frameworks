// Copyright © 2020 CapTech. All rights reserved.

import XCTest
@testable import Favorites

class FileListLoaderTests: XCTestCase {

    func testBadFileName_ReturnsEmptyArray() {
        let sut = FileListLoader(fileName: "FakeName", fileType: ".txt")
        XCTAssertTrue(sut.load().isEmpty)
    }

}
