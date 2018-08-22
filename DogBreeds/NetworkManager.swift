//
//  Network Manager.swift
//  DogBreeds
//
//  Created by Taylor Smith on 8/22/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import Foundation
import Alamofire

//network call to fetch the data from the dog api (using alamofire)

class NetworkManager {

    func fetchBreeds(completion: @escaping ([DogBreed]?, Error?) -> Void) {
        let url = "https://dog.ceo/api/breeds/list/all"
        Alamofire.request(url).responseJSON { response in
            let decoder = JSONDecoder()
            if let result = try? decoder.decode(DogBreed.self, from: response.data!) {
                completion([result], nil)
            } else {
                print("not decoded")
            }
        }
    }
}
