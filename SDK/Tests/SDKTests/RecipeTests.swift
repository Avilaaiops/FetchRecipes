//
//  RecipeTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//


import XCTest
@testable import SDK

class RecipeTests: XCTestCase {

    func testRecipeDecoding() {
            let json = """
            {
                "cuisine": "Italian",
                "name": "Spaghetti Carbonara",
                "photo_url_large": "https://example.com/photo_large.jpg",
                "photo_url_small": "https://example.com/photo_small.jpg",
                "uuid": "123e4567-e89b-12d3-a456-426614174000",
                "source_url": "https://example.com/recipe",
                "youtube_url": "https://youtube.com/watch?v=dQw4w9WgXcQ"
            }
            """.data(using: .utf8)!

            do {
                let decoder = JSONDecoder()
                let recipe = try decoder.decode(Recipe.self, from: json)
                
                XCTAssertEqual(recipe.cuisine, "Italian")
                XCTAssertEqual(recipe.name, "Spaghetti Carbonara")
                XCTAssertEqual(recipe.photoURLLarge, URL(string: "https://example.com/photo_large.jpg"))
                XCTAssertEqual(recipe.photoURLSmall, URL(string: "https://example.com/photo_small.jpg"))
                XCTAssertEqual(recipe.uuid, "123e4567-e89b-12d3-a456-426614174000")
                XCTAssertEqual(recipe.sourceURL, URL(string: "https://example.com/recipe"))
                XCTAssertEqual(recipe.youtubeURL, URL(string: "https://youtube.com/watch?v=dQw4w9WgXcQ"))
            } catch {
                XCTFail("Decoding failed: \(error)")
            }
        }

    func testRecipeDecodingInvalidData() {
        let invalidJson = """
        {
            "cuisine": "British",
            "photo_url_large": "https://example.com/photo_large.jpg",
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
