//
//  Player View.swift
//  Music App
//
//  Created by Tyson Laroyce Walker II on 1/23/23.
//

import Foundation
import SwiftUI
import Firebase
import AVFoundation
struct PlayerView: View{
    var album:Album
    var song:Song
    
   @State var player = AVPlayer()
    
    @State var isPlaying : Bool = false
    
    var body:some View{
        ZStack{
            Image(album.image).resizable().edgesIgnoringSafeArea(.all)
            Blur(style: .dark).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                AlbumArt(album: album, isWithText: false)
                Text(song.name).font(.title).fontWeight(.light).foregroundColor(.white)
                Spacer()
                ZStack{
                    Color.white.cornerRadius(20).shadow(radius: 10)
                    HStack{
                        Button(action: self.previous, label: {
                            Image(systemName:"arrow.left.circle").resizable()
                        }).frame(width: 50, height:50, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                        
                        Button(action: self.playPause, label: {
                            Image(systemName: isPlaying ? "play.circle.fill" :  "pause.circle.fill").resizable()
                        }).frame(width: 70, height:70, alignment: .center).padding()
                        
                        Button(action: self.next, label: {
                            Image(systemName: "arrow.right.circle").resizable()
                        }).frame(width: 50, height:50, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                    }
                    
                    
                   
                }.edgesIgnoringSafeArea(.bottom).frame(height:200, alignment: .center)
            }
        }.onAppear(){
            let storage = Storage.storage().reference(forURL: self.song.file)
            storage.downloadURL{(url,error) in
                if error != nil {
                    print(error)
                }else{
                    print(url?.absoluteString)
                    player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                    player.play()
                }
            }
            
           
        }
        
       
        
    }
    
    func playPause(){
        self.isPlaying.toggle()
        if isPlaying == true{
            player.pause()
        }else{
            player.play()
        }
    }
    
    func next(){
        let storage2 = Storage.storage().reference(forURL: "gs://music-app-79322.appspot.com/song/intrntpnk.flac")
        storage2.downloadURL{(url,error) in
            if error != nil {
                print(error)
            }else{
                print(url?.absoluteString)
                player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                player.play()
            }
        }
    }
    
    func previous(){
        
    }
    
}
