module Update exposing (..)

import Messages exposing (..)
import Model exposing (Model, Sound)
import Port exposing (playSound)
import SoundUpdate exposing (..)
import SoundSelect exposing (soundByKeyCode)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaySound sound ->
            ( { model | sounds = (updateStart sound.idName model.sounds) }, playSound sound )

        KeyPlaySound keyCode ->
            case soundByKeyCode keyCode model.sounds of
                Just sound ->
                    ( { model | sounds = (updateStart sound.idName model.sounds) }, playSound sound )

                Nothing ->
                    ( model, Cmd.none )

        StoppedSound idName ->
            { model | sounds = (updateStop idName model.sounds) } ! []

        NoOp ->
            ( model, Cmd.none )
