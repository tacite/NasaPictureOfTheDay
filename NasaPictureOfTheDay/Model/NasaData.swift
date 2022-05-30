//
//  NasaData.swift
//  NasaPictureOfTheDay
//
//  Created by David Tacite on 24/05/2022.
//

import Foundation

class NasaData {
    let nasaAPI = NasaAPI()
    
    func fetchAPOD() async -> NasaAPOD {
        do {
            return try await nasaAPI.fetchAPOD()
        } catch {
            return NasaAPOD(copyright: "toto", date: "toto", explanation: "toto", hdurl: "toto", mediaType: "toto", serviceVersion: "toto", title: "toto", url: "toto")
        }
    }
}
