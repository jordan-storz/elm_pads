module Model exposing (..)


type alias Model =
    { sounds : List Sound
    }


type alias Sound =
    { url : String
    , name : String
    }


initialModel : Model
initialModel =
    { sounds = sampleSounds
    }


sampleSounds : List Sound
sampleSounds =
    [ { url = "https://earbyter-1.s3.amazonaws.com/bells.m4a"
      , name = "Bells"
      }
    , { url = "https://s3-us-west-2.amazonaws.com/earbyter-1/birdchirps1.m4a"
      , name = "Birds"
      }
    ]
