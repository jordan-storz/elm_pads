module Messages exposing (..)

import Model exposing (Sound)


type Msg
    = PlaySound Sound
    | KeyPlaySound Int
    | StopSound Sound
    | StoppedSound String
    | NoOp
