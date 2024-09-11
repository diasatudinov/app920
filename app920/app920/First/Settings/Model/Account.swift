//
//  Account.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct Account: Codable {
    var imageData: Data?
    var name: String
    var age: String
    var gender: String
    var description: String
    
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
