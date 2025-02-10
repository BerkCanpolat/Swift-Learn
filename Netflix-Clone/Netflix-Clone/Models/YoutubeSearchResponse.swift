//
//  YoutubeSearchResponse.swift
//  Netflix-Clone
//
//  Created by Berk Canpolat on 10.02.2025.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
