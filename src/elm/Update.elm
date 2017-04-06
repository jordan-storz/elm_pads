module Update exposing (..)

import Messages exposing (..)
import Model exposing (Model)
import Port exposing (playSound)
import SoundUpdate exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaySound sound ->
            ( { model | sounds = (updateStart sound.idName model.sounds) }, playSound sound )

        StoppedSound idName ->
            { model | sounds = (updateStop idName model.sounds) } ! []
