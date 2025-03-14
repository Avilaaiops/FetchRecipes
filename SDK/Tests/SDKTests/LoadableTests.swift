//
//  LoadableTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//


import XCTest
@testable import SDK

class LoadableTests: XCTestCase {

    func testSetIsLoading() {
        var loadable: Loadable<String> = .notRequested
        loadable.setIsLoading()
        XCTAssertEqual(loadable, .isLoading(last: nil))

        loadable = .loaded("Test")
        loadable.setIsLoading()
        XCTAssertEqual(loadable, .isLoading(last: "Test"))
    }

    func testCancelLoading() {
        var loadable: Loadable<String> = .isLoading(last: "Test")
        loadable.cancelLoading()
        XCTAssertEqual(loadable, .loaded("Test"))

        loadable = .isLoading(last: nil)
        loadable.cancelLoading()
        XCTAssertEqual(loadable.error?.localizedDescription, "Canceled by user")
    }

    func testMap() {
        let loadable: Loadable<Int> = .loaded(2)
        let mappedLoadable = loadable.map { $0 * 2 }
        XCTAssertEqual(mappedLoadable, .loaded(4))

        let failedLoadable: Loadable<Int> = .failed(NSError(domain: "", code: 0, userInfo: nil))
        let mappedFailedLoadable = failedLoadable.map { $0 * 2 }
        XCTAssertEqual(mappedFailedLoadable.error?.localizedDescription, failedLoadable.error?.localizedDescription)
    }

    func testEquatable() {
        XCTAssertEqual(Loadable<Int>.notRequested, Loadable<Int>.notRequested)
        XCTAssertEqual(Loadable<Int>.isLoading(last: 1), Loadable<Int>.isLoading(last: 1))
        XCTAssertEqual(Loadable<Int>.loaded(1), Loadable<Int>.loaded(1))
        XCTAssertEqual(Loadable<Int>.failed(NSError(domain: "", code: 0, userInfo: nil)), Loadable<Int>.failed(NSError(domain: "", code: 0, userInfo: nil)))
    }
}
