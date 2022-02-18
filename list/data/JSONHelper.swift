//
//  JSONHelper.swift
//  list
//
//  Created by m1 on 17/02/2022.
//

import Foundation

struct JSONHelper{
    
    static func loadFromFile(filename:String, ext: String) -> Result<Data,JSONError>{
        guard let fileURL = Bundle.main.url(forResource:filename, withExtension:ext)
        else { return .failure(.fileNotFound(filename+"."+ext)) }
        guard let content = try? Data(contentsOf: fileURL)
        else { return .failure(.JsonDecodingFailed) }
        return .success(content)
    }

    static func decode<T: Decodable>(data: Data) -> T?{
        let decoder = JSONDecoder() // création d'un décodeur
        if (try? decoder.decode([T].self, from:data)) != nil { // si on a réussit à décoder
            return nil
        }
        return nil
    }
   
}
