port module Port exposing (..)

import Model exposing (Sound)


port playSound : Sound -> Cmd msg
