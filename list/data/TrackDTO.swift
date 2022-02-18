//
//  TrackDTO.swift
//  list
//
//  Created by m1 on 17/02/2022.
//

import Foundation

struct TrackDTO: Decodable{
    
   static func tracksDTO2Track(data: [TrackDTO]) -> [Track]?{
      var tracks = [Track]()
      for tdata in data{
         guard (tdata.collectionId != nil) || (tdata.trackId != nil) else{
            return nil
         }
         let id : Int = tdata.trackId ?? tdata.collectionId!
          let track = Track(trackId: id, trackName: tdata.trackName! , tdata.artistName, tdata.collectionName, tdata.releaseDate, url : tdata.url)
         tracks.append(track)
      }
      return tracks
    }
    var trackId: Int?
    var collectionId: Int?
    var trackName: String?
    var artistName: String
    var collectionName: String
    var url: String?
    var releaseDate: String

}
