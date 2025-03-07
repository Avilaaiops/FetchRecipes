//
//  RecipeTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//


import XCTest
@testable import SDK

class RecipeTests: XCTestCase {

    func testRecipeDecoding() throws {
        let json = """
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://some.url/large.jpg",
            "photo_url_small": "https://some.url/small.jpg",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "source_url": "https://some.url/index.html",
            "youtube_url": "https://www.youtube.com/watch?v=some.id"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let recipe = try decoder.decode(Recipe.self, from: json)

        XCTAssertEqual(recipe.cuisine, "British")
        XCTAssertEqual(recipe.name, "Bakewell Tart")
        XCTAssertEqual(recipe.photoURLLarge.absoluteString, "https://some.url/large.jpg")
        XCTAssertEqual(recipe.photoURLSmall.absoluteString, "https://some.url/small.jpg")
        XCTAssertEqual(recipe.uuid, "eed6005f-f8c8-451f-98d0-4088e2b40eb6")
        XCTAssertEqual(recipe.sourceURL.absoluteString, "https://some.url/index.html")
        XCTAssertEqual(recipe.youtubeURL.absoluteString, "https://www.youtube.com/watch?v=some.id")
    }

    func testRecipeDecodingInvalidData() {
        let invalidJson = """
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "invalid_url",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "source_url": "https://some.url/index.html"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        XCTAssertThrowsError(try decoder.decode(Recipe.self, from: invalidJson)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
