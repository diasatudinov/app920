//
//  AttractionViewModel.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

class AttractionViewModel: ObservableObject {
    //Attraction(name: "", country: "", city: "", cost: "", description: "", excursion: "")
    @Published var attractions: [Attraction] = [] {
        didSet {
            saveAttractions()
        }
    }
    
    private let attractionsFileName = "attractions.json"

    init() {
        loadAttractions()
    }
    
    func addMemory(_ attraction: Attraction, _ memory: Memory) {
        if let index = attractions.firstIndex(where: { $0.id == attraction.id }) {
            attractions[index].memories.append(memory)
        }
    }
    
    func addAttraction(_ attraction: Attraction) {
        attractions.append(attraction)
    }
    func deleteAttraction(for attraction: Attraction) {
        if let index = attractions.firstIndex(where: { $0.id == attraction.id }) {
            attractions.remove(at: index)
            
        }
        
    }
    
    func editMemory(for attraction: Attraction, memory: Memory, image: UIImage?, heading: String, description: String) {
        if let index = attractions.firstIndex(where: { $0.id == attraction.id }) {
            
            if let indexMemory = attractions[index].memories.firstIndex(where: { $0.id == memory.id }) {
                attractions[index].memories[indexMemory].image = image
                attractions[index].memories[indexMemory].heading = heading
                attractions[index].memories[indexMemory].description = description
            }
            
        }
        
    }
    
    func editAttraction(for attraction: Attraction, image: UIImage?, name: String, country: String, city: String, cost: String, description: String, excursion: String) {
        if let index = attractions.firstIndex(where: { $0.name == attraction.name }) {
            attractions[index].image = image
            attractions[index].name = name
            attractions[index].country = country
            attractions[index].city = city
            attractions[index].cost = cost
            attractions[index].description = description
            attractions[index].excursion = excursion
            
        }
        
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func attractionsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(attractionsFileName)
    }
    
   
    
    private func saveAttractions() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.attractions)
                try data.write(to: self.attractionsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadAttractions() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: attractionsFilePath())
            attractions = try decoder.decode([Attraction].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
}
