module Model exposing (..)


type alias Model =
    { sound : Sound
    }


type alias Sound =
    { url : String
    , name : String
    }


initialModel : Model
initialModel =
    { sound = sampleSound
    }


sampleSound : Sound
sampleSound =
    { url = "https://earbyter-1.s3.amazonaws.com/bells.m4a"
    , name = "Bells"
    }
