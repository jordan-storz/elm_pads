module Model exposing (..)


type alias Model =
    { sounds : List Sound
    , editSound : Sound
    }


type alias Sound =
    { url : String
    , idName : String
    , playing : Bool
    , keyCode : Int
    , stopCode : Int
    }


type ControlType
    = Play
    | Stop


initialModel : Model
initialModel =
    { sounds = sampleSounds
    , editSound = firstSound sampleSounds
    }


sampleSounds : List Sound
sampleSounds =
    [ { url = "https://earbyter-1.s3.amazonaws.com/bells.m4a"
      , idName = "sound-1"
      , playing = False
      , keyCode = 71
      , stopCode = 67
      }
    , { url = "https://s3-us-west-2.amazonaws.com/earbyter-1/birdchirps1.m4a"
      , idName = "sound-2"
      , playing = False
      , keyCode = 76
      , stopCode = 191
      }
    , { url = "http://www.noiseaddicts.com/samples_1w72b820/3724.mp3"
      , idName = "sound-3"
      , playing = False
      , keyCode = 66
      , stopCode = 77
      }
    , { url = "https://earbyter-1.s3.amazonaws.com/bowlingstrike.m4a"
      , idName = "sound-4"
      , playing = False
      , keyCode = 86
      , stopCode = 90
      }
    ]


firstSound : List Sound -> Sound
firstSound sounds =
    case List.head sounds of
        Just sound ->
            sound

        Nothing ->
            Sound "" "" False 11 12
