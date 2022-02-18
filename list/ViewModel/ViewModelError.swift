//
//  ViewModelError.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import Foundation

enum ViewModelError : Error, Equatable, CustomStringConvertible{
    
    case tooShortName(String)
    case dateError(String)
    
    var description: String {
        switch(self){
        case .tooShortName(let name) :
            return "The name is too short : "+name
        case .dateError(let error) :
            return "This date is illegal : "+error
        }
    }
}
