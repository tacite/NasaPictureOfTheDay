//
//  NasaAPI.swift
//  NasaPictureOfTheDay
//
//  Created by David Tacite on 24/05/2022.
//

import Foundation

struct NasaAPI {
    
    enum APIError: Error {
      case requestURLInvalid(String)
    }
    
    let apiKey = "5VBaQ88jjJJkw0Zfhd9uVbNFyX7dnDqf4QU5mirf"
    let apiURL = "https://api.nasa.gov/planetary/apod"
    
    func fetchAPOD() async throws -> NasaAPOD {
        print("cum")
        let api = APIRequest<NasaAPOD>(urlString: apiURL)
        print(api)
        let nasaAPOD = try await request(api)
        print(nasaAPOD)
        return nasaAPOD
    }
    
    func request<T>(_ apiRequest: APIRequest<T>) async throws -> T {
        guard var components = URLComponents(string: apiRequest.urlString) else {
        throw APIError.requestURLInvalid(apiRequest.urlString)
      }
        
        let queryItems = (components.queryItems ?? []) + [URLQueryItem(name: "api_key", value: apiKey)]
        components.queryItems = queryItems
    
        guard let apiURL = components.url else {
        throw APIError.requestURLInvalid(apiRequest.urlString)
      }

      let request = URLRequest(url: apiURL)
      let data = try await URLSession.shared.data(for: request, delegate: nil).0
      return try apiRequest.decodeJSON(data)
    }
}

struct APIRequest<T: Decodable> {
  var urlString: String
  let decodeJSON: (Data) throws -> T
}

extension APIRequest {
  init(urlString: String) {
    self.urlString = urlString
    self.decodeJSON = { data in
      return try JSONDecoder().decode(T.self, from: data)
    }
  }
}
