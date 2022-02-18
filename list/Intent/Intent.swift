//
//  Intent.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import Foundation
import Combine

class Intent {
    
    private var state = PassthroughSubject<TrackState,Never>()
    
    func intentToChange(name : String){
        self.state.send(.changingName(name))
    }
    
    func intentToChange(artist : String){
        self.state.send(.changingArtist(artist))
    }
    
    func intentToChange(collection : String){
        self.state.send(.changingCollection(collection))
    }
    
    func intentToChange(date : String){
        self.state.send(.changingDate(date))
    }
    
    func addObserver(vm : TrackViewModel){
        self.state.subscribe(vm)
    }
    
}
