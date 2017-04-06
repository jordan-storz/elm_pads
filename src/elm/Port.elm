port module Port exposing (..)

import Model exposing (Sound)


port playSound : Sound -> Cmd msg


port initialize : () -> Cmd msg


port stopSound : (String -> msg) -> Sub msg
