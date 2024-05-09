//
//  ModelData.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import Foundation

@Observable
class ModelData {
    var todosOpening: [Todo] = load("openingTasks.json")
    var todosClosing: [Todo] = load("closingTasks.json")
}

var climbs: [Climb] = load("climbsData.json")
var profiles: [Profile] = load("profilesData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
