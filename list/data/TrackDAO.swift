//
//  TrackDAO.swift
//  list
//
//  Created by m1 on 17/02/2022.
//

import Foundation

struct TrackDAO {
    
    public var trackId : Int
    public var trackName : String
    public var collection : String
    public var releaseDate : String
    
    init(trackId:Int,trackName:String,collection:String,releaseDate:String){
        self.trackId = trackId
        self.trackName = trackName
        self.collection = collection
        self.releaseDate = releaseDate
    }
    
    
    
}
