//
//  Attraction.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct Attraction: Identifiable, Hashable, Codable  {
    let id = UUID()
    var name: String
    var country: String
    var city: String
    var cost: String
    var description : String
    var excursion: String
    var imageData: Data?
    
    var memories: [Memory] = []
    enum CodingKeys: String, CodingKey {
        case id, imageData, name, country, city, cost, description, excursion, memories
    }
    
    var image: UIImage? {
        get {
            guard let data = imageData else { return nil }
            return UIImage(data: data)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
}

extension Attraction {
    func firstFourImages() -> [UIImage] {
        // Get first 4 non-nil images from the memories array
        return memories.compactMap { $0.image }.prefix(4).map { $0 }
    }
}

