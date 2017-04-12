module Main exposing (..)

import Html exposing (..)
import Model exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Messages exposing (Msg)
import Subscription exposing (subscriptions)
import Port
import Fetch


main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, initializeProgram )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


initializeProgram : Cmd Msg
initializeProgram =
    Cmd.batch
        [ Port.initialize ()
        , Fetch.fetchDefaultSoundBank
        ]
