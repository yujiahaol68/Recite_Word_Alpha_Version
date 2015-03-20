// Playground - noun: a place where people can play

import UIKit
import MediaPlayer

var URL = NSURL(string: "http://www.gstatic.com/dictionary/static/sounds/de/0/unconscious.mp3")
var audioPlayer:MPMoviePlayerController=MPMoviePlayerController()
audioPlayer.contentURL = URL
audioPlayer.play()