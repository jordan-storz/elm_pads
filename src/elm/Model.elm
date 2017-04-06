module Model exposing (..)


type alias Model =
    { sounds : List Sound
    }


type alias Sound =
    { url : String
    , idName : String
    , playing : Bool
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
      }
    , { url = "https://s3-us-west-2.amazonaws.com/earbyter-1/birdchirps1.m4a"
      , idName = "sound-2"
      , playing = False
      }
    ]
