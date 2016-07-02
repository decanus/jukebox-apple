//: Playground - noun: a place where people can play

import Jukebox

JNConfiguration.isDevelopment = true
JNConfiguration.apiKey = "5eecc5da-0ff0-4aa0-98a0-ebcdfab3336c"

let searchHandler = JNSearch()
searchHandler.search(query: "sia") { (results) in
    print(results)
}
