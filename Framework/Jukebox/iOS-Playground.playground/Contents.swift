//: Playground - noun: a place where people can play


import JukeboxNinja


var queue = JNQueue()

let track1 = JNYoutubeTrack(id: 0, title: "Track 1", artists: [JNArtist](), duration: 0)
let track2 = JNYoutubeTrack(id: 1, title: "Track 2", artists: [JNArtist](), duration: 0)
let track3 = JNYoutubeTrack(id: 2, title: "Track 3", artists: [JNArtist](), duration: 0)

queue += track1
queue += track2
queue += track3
