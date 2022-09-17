//
//  ADODApi.swift
//  AstroImage
//
//  Created by Roman on 17.09.22.
//

import Foundation

struct APODApi {
    
    let dateFormatter: DateFormatter = DateFormatter()
    static let singleton: APODApi = APODApi()
    let apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    func getTodaysImage(handler: @escaping ((APODResponse?) -> Void)) async {
        let urlString: String = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            debugPrint("There is not URL found.")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(APODResponse.self, from: data) {
                handler(decodedResponse)
            }
        } catch {
            debugPrint("Invalid data")
        }
    }
    
    func getImageForDate(for date: Date) async {
        dateFormatter.dateFormat = "YYYY-MM-DD"
        let dateString: String = dateFormatter.string(from: date)
        debugPrint("Today's date: \(dateString)")
    }
    
    func getImagesFromDateRange(from startdate: Date, to endDate: Date) async {
        
    }
    
    func getRandomImages(amount: Int) async {
        
    }
    
}
