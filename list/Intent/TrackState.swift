//
//  State.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import Foundation

enum TrackState : Equatable {
    
    case ready
    
    case changingName(String)
    case changingNameError(ViewModelError)
    case nameChanged(String)
    
    case changingArtist(String)
    case changingArtistError(ViewModelError)
    case artistChanged(String)
    
    case changingCollection(String)
    case changingCollectionError(ViewModelError)
    case collectionChanged(String)
    
    case changingDate(String)
    case changingDateError(ViewModelError)
    case dateChanged(String)
    
}
