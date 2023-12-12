//
//  GifEndpointTests.swift
//  GiphSearchTests
//
//

import XCTest
@testable import GiphSearch

final class GifEndpointTests: XCTestCase {

    func testEndpointURLCreation() throws {
        // Given
        let searchTerm = "Oreos"
        
        // When
        let endpoint = GifEndpoint.search(term:"\(searchTerm)").url

        // Then
        let expectedEndpoint = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=229ac3e932794695b695e71a9076f4e5&limit=25&offset=0&rating=G&lang=en&q=Oreos")
        XCTAssertEqual(endpoint, expectedEndpoint)
    }
}
