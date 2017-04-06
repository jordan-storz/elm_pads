module Messages exposing (..)

import Model exposing (Sound)


type Msg
    = PlaySound Sound
    | KeyPlaySound Int
    | StoppedSound String
    | NoOp
