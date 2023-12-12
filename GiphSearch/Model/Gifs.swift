//
//  Gifs.swift
//  GiphSearch
//
//

import Foundation

struct Gifs: Codable {
    var data: [Gif]
}

struct Gif: Codable {
    var id: String
    var url: String
    let images: GifImages
    var title: String
}

struct GifImages: Codable {
    let original: GifUrl
}

struct GifUrl: Codable {
    let height: String
    let width : String
    let url: String
}
