module Messages exposing (..)

import Model exposing (Sound, Pad)


type Msg
    = PlaySound Pad
    | KeyPlaySound Int
    | StopSound Pad
    | KeyStopSound Int
    | StoppedSound Int
    | NoOp
