//
//  Track.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import Foundation

class Track : ObservableObject{
    
    public var observer : TrackObserver?
    
    public final var trackId : Int
    
    public var trackName : String?{
        didSet{
        }
    }
    public var artistName : String{
        didSet{
        }
    }
    public var collectionName : String{
        didSet{
            
        }
    }
    public var releaseDate : String{
        didSet{
            
        }
    }
    public var url : URL?{
        didSet{
            
        }
    }
    
    init(trackId : Int, trackName : String = "track1",_ artistName : String = "artist1",_ collectionName : String = "collection1",_ releaseDate : String = "05/01/2022", url : String){
        self.trackId = trackId
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.releaseDate = releaseDate
        self.url = URL(string: url)
    }
}
