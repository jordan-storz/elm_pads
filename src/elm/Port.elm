port module Port exposing (..)

import Model exposing (Sound, Pad)


port playSound : Pad -> Cmd msg


port initialize : () -> Cmd msg


port stopSound : Pad -> Cmd msg


port soundStopped : (Int -> msg) -> Sub msg
