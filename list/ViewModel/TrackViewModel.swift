//
//  TrackViewModel.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import Foundation
import Combine
import SwiftUI

class TrackViewModel : ObservableObject, TrackObserver, Subscriber {
    
    typealias Input = TrackState
    typealias Failure = Never
    
    private var model : Track
    
    @Published public var error : ViewModelError = .tooShortName("_")
    
    @Published public var trackId : Int
    @Published public var trackName : String
    @Published public var artistName : String
    @Published public var collectionName : String
    @Published public var releaseDate : String
    
    
    init(model : Track){
        self.model = model
        
        self.trackId = self.model.trackId
        self.trackName = self.model.trackName
        self.artistName = self.model.artistName
        self.collectionName = self.model.collectionName
        self.releaseDate = self.model.releaseDate
        
        self.model.observer = self
    }
    
    //observer
    
    func changed(name: String) {
        self.trackName = name
    }
    func changed(artist: String) {
        self.artistName = artist
    }
    func changed(collection: String) {
        self.collectionName = collection
    }
    func changed(date: String) {
        self.releaseDate = date
    }
    
    func receive(subscription: Subscription) {
        return
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        return
    }
    
    func receive(_ input: TrackState) -> Subscribers.Demand {
        switch(input){
        case .changingName(let name) :
            self.model.trackName = name
            if(name != self.model.trackName){
                self.error = .tooShortName(name)
                self.trackName = self.model.trackName
            }
        case .changingArtist(let artist) :
            self.model.artistName = artist
            if(artist != self.model.artistName){
                self.error = .tooShortName(artist)
                self.artistName = self.model.artistName
            }
        case .changingCollection(let collection) :
            self.model.collectionName = collection
            if(collection != self.model.collectionName){
                self.error = .tooShortName(collection)
                self.collectionName = collection
            }
        case .changingDate(let date) :
            self.model.releaseDate = date
            if(date != self.model.releaseDate){
                self.error = .dateError(date)
                self.releaseDate = self.model.releaseDate
            }
        default : return .none
        }
        return .none
    }
    
    
}
