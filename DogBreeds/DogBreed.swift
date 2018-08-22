//
//  DogBreed.swift
//  DogBreeds
//
//  Created by Taylor Smith on 8/22/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import Foundation


// object to hold the dog breeds

struct DogBreed: Codable {
    var status: String
    var message: [String : [String]]
    
}
