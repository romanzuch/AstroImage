//
//  ADODApi.swift
//  AstroImage
//
//  Created by Roman on 17.09.22.
//

import Foundation
import UIKit

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
    
    func getImagesFromDateRange(from startDate: Date, to endDate: Date, handler: @escaping (([APODResponse]?) -> Void)) async {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDateString: String = dateFormatter.string(from: startDate)
        let endDateString: String = dateFormatter.string(from: endDate)
        let urlString: String = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)&start_date=\(startDateString)&end_date=\(endDateString)"
        guard let url = URL(string: urlString) else {
            debugPrint("There is no URL found.")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([APODResponse].self, from: data) {
                debugPrint(decodedResponse)
                handler(decodedResponse)
            }
        } catch {
            debugPrint("Invalid data")
        }
    }
    
    func getRandomImages(amount: Int) async {
        
    }
    
    func getImageForDownload(for url: String, handler: @escaping ((UIImage) -> Void)) async {
        guard let url = URL(string: url) else {
            debugPrint("No URL found")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            handler(UIImage(data: data) ?? UIImage())
        } catch {
            debugPrint("Error occured catching the image")
        }
    }
    
}
