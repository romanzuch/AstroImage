//
//  ActivitySheet.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import LinkPresentation
import UIKit

struct ActivitySheet {
    
    static let main: ActivitySheet = ActivitySheet()
    
    /// Creates an ActivityViewController to share the response text & SD image URL
    ///
    /// - parameters: for: Here comes the actual API response
    /// - returns: none
    func actionSheet(for result: APODResponse) {
        guard let url = URL(string: result.sdurl) else { return }
        let title = result.title
        let activityVC = UIActivityViewController(activityItems: [title, url], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    /// Creates an ActivityViewController to share the response's SD quality image
    ///
    /// - parameters: for: Here comes the image as UIImage
    /// - returns: none
    func actionSheet(for image: UIImage) {
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
}
