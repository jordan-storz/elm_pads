module Subscription exposing (..)

import Model exposing (Model)
import Messages exposing (..)
import Port
import Keyboard


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Port.soundStopped StoppedSound
        , Keyboard.downs routeKeyCode
        ]


routeKeyCode : Keyboard.KeyCode -> Msg
routeKeyCode keyCode =
    case keyCode of
        71 ->
            KeyPlaySound keyCode

        76 ->
            KeyPlaySound keyCode

        66 ->
            KeyPlaySound keyCode

        86 ->
            KeyPlaySound keyCode

        _ ->
            NoOp
