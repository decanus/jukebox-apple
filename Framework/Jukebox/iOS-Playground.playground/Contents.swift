//: Playground - noun: a place where people can play

import JukeboxNinja


var queue = JNQueue()

let track1 = JNYoutubeTrack(id: "", title: "Track 1", artist: "", duration: 0)
let track2 = JNYoutubeTrack(id: "", title: "Track 2", artist: "", duration: 0)
let track3 = JNYoutubeTrack(id: "", title: "Track 3", artist: "", duration: 0)

queue += track1
queue += track2
queue += track3
