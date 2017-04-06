module Model exposing (..)


type alias Model =
    { sounds : List Sound
    }


type alias Sound =
    { url : String
    , idName : String
    , playing : Bool
    , keyCode : Int
    }


initialModel : Model
initialModel =
    { sounds = sampleSounds
    }


sampleSounds : List Sound
sampleSounds =
    [ { url = "https://earbyter-1.s3.amazonaws.com/bells.m4a"
      , idName = "sound-1"
      , playing = False
      , keyCode = 71
      }
    , { url = "https://s3-us-west-2.amazonaws.com/earbyter-1/birdchirps1.m4a"
      , idName = "sound-2"
      , playing = False
      , keyCode = 76
      }
    , { url = "http://www.noiseaddicts.com/samples_1w72b820/3724.mp3"
      , idName = "sound-3"
      , playing = False
      , keyCode = 66
      }
    , { url = "https://earbyter-1.s3.amazonaws.com/bowlingstrike.m4a"
      , idName = "sound-4"
      , playing = False
      , keyCode = 86
      }
    ]
