module Subscription exposing (..)

import Model exposing (Model)
import Messages exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
