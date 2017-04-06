module Subscription exposing (..)

import Model exposing (Model)
import Messages exposing (..)
import Port


subscriptions : Model -> Sub Msg
subscriptions model =
    Port.stopSound StoppedSound
