module Update exposing (..)

import Messages exposing (..)
import Model exposing (Model)
import Port exposing (playSound)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaySound sound ->
            ( model, playSound sound )
