//
//  TrackObserver.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import Foundation

protocol TrackObserver{
    
    func changed(name : String)
    func changed(artist : String)
    func changed(collection : String)
    func changed(date : String)
    
}
