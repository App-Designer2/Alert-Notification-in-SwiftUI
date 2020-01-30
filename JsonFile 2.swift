//
//  JsonFile.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 22.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import Foundation

let livingData: [Livingroom] = load("Rent.json")

func load<T:Decodable>(_ filename:String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
       fatalError("Couldnt find \(filename) in main bundle.")
       }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldnt load \(filename) from main bundle: \n\(error)")
       }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldnt parse \(filename) as \(T.self): \(error)")
    }
}
