module Main exposing (..)

import Html exposing (..)
import Model exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Messages exposing (Msg)
import Subscription exposing (subscriptions)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
