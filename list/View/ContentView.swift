//
//  ContentView.swift
//  list
//
//  Created by m1 on 16/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm : TrackViewModel
    var intent : Intent
    
    init(vm : TrackViewModel){
        self.vm = vm
        self.intent = Intent()
        self.intent.addObserver(vm: vm)
    }
    
    @State var errorMessage = "Error !"
    @State var showingAlert : Bool = false
    @State var showingSheet : Bool = false
    
    var list = [Track("Track 1"),Track("Track 2"),Track("Track 3")]
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        VStack {
            List {
                ForEach(list, id:\.trackId){
                    track in
                    VStack(spacing: 10) {
                        HStack{
                            Text("Track name : ")
                            TextField("\(track.trackName)",text:$vm.trackName)
                                .onSubmit {
                                    intent.intentToChange(name: vm.trackName)
                                }
                        }
                        HStack{
                            Text("Artist : ")
                            TextField("\(track.artistName)",text:$vm.artistName)
                                .onSubmit {
                                    intent.intentToChange(artist: vm.artistName)
                                }
                        }
                        HStack{
                            Text("Collection : ")
                            TextField("\(track.collectionName)",text:$vm.collectionName)
                                .onSubmit {
                                    intent.intentToChange(collection: vm.collectionName)
                                }
                        }
                        HStack{
                            Text("Release date : ")
                            TextField("\(track.releaseDate)",text:$vm.releaseDate)
                                .onSubmit {
                                    intent.intentToChange(date: vm.releaseDate)
                                }
                        }
                        Spacer(minLength: 10)
                        Divider()
                    }
                }
            }
        }
        .alert("\(errorMessage)",isPresented: $showingAlert){
            Button("OK",role: .cancel){}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm : TrackViewModel(model: Track()))
    }
}
