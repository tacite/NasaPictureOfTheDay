//
//  NasaModel.swift
//  NasaPictureOfTheDay
//
//  Created by David Tacite on 24/05/2022.
//

import Foundation

// MARK: - NasaAPOD
struct NasaAPOD: Codable {
    let copyright, date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
