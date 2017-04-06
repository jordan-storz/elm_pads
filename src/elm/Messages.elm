module Messages exposing (..)

import Model exposing (Sound)


type Msg
    = PlaySound Sound
    | KeyPlaySound Int
    | StopSound Sound
    | KeyStopSound Int
    | StoppedSound String
    | NoOp
