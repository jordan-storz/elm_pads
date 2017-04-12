module Subscription exposing (..)

import Model exposing (Model, ControlType)
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
    case whichControl keyCode of
        Just (Model.Play) ->
            KeyPlaySound keyCode

        Just (Model.Stop) ->
            KeyStopSound keyCode

        Nothing ->
            NoOp


playKeyCodes : List Keyboard.KeyCode
playKeyCodes =
    [ 71, 76, 66, 86 ]


stopKeyCodes : List Keyboard.KeyCode
stopKeyCodes =
    [ 67, 191, 77, 90 ]


whichControl : Keyboard.KeyCode -> Maybe ControlType
whichControl keyCode =
    if List.member keyCode playKeyCodes then
        Just Model.Play
    else if List.member keyCode stopKeyCodes then
        Just Model.Stop
    else
        Nothing
