//
//  HomeVM.swift
//  AstroImage
//
//  Created by Roman on 16.09.22.
//

import Foundation

class HomeViewModel: ObservableObject {
    let testString = """
    {
        "copyright": "Martin Pugh",
        "date": "2021-09-09",
        "explanation": "A star cluster around 2 million years young surrounded by natal clouds of dust and glowing gas, M16 is also known as The Eagle Nebula. This beautifully detailed image of the region adopts the colorful Hubble palette and includes cosmic sculptures made famous in Hubble Space Telescope close-ups of the starforming complex. Described as elephant trunks or Pillars of Creation, dense, dusty columns rising near the center are light-years in length but are gravitationally contracting to form stars. Energetic radiation from the cluster stars erodes material near the tips, eventually exposing the embedded new stars. Extending from the ridge of bright emission left of center is another dusty starforming column known as the Fairy of Eagle Nebula. M16 lies about 7,000 light-years away, an easy target for binoculars or small telescopes in a nebula rich part of the sky toward the split constellation Serpens Cauda (the tail of the snake).",
        "hdurl": "https://apod.nasa.gov/apod/image/2109/M16SHO.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "M16 Close Up",
        "url": "https://apod.nasa.gov/apod/image/2109/M16SHO_1024.jpg"
    }
    """
    var testData: APODResponse {
        let jsonData: Data = Data(self.testString.utf8)
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(APODResponse.self, from: jsonData)
            return data
        } catch {
            print(error.localizedDescription)
        }
        return APODResponse()
    }
    
    func getSDImageUrl(from string: String) -> URL {
        return URL(string: string)!
    }
    
    //MARK: - API Methods relevant to the Home View
    func getTodaysImage() -> APODResponse {
        APODResponse()
    }
}