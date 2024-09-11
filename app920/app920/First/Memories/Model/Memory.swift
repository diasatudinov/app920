//
//  Memory.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct Memory: Identifiable, Hashable, Codable  {
    let id = UUID()
    var heading: String
    var description : String
    var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id, imageData, heading, description
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
