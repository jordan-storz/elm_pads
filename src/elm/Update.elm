module Update exposing (..)

import Messages exposing (..)
import Model exposing (Model, Sound, ControlType)
import Port exposing (playSound, stopSound)
import SoundUpdate exposing (..)
import SoundSelect exposing (soundByKeyCode)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaySound sound ->
            playUpdateModel sound model

        KeyPlaySound keyCode ->
            case soundByKeyCode keyCode model.sounds of
                Just sound ->
                    playUpdateModel sound model

                Nothing ->
                    ( model, Cmd.none )

        KeyStopSound keyCode ->
            case soundByKeyCode keyCode model.sounds of
                Just sound ->
                    stopUpdateModel sound model

                Nothing ->
                    ( model, Cmd.none )

        StopSound sound ->
            ( model, stopSound sound )

        StoppedSound idName ->
            { model | sounds = (updateStop idName model.sounds) } ! []

        NoOp ->
            ( model, Cmd.none )


playUpdateModel : Sound -> Model -> ( Model, Cmd Msg )
playUpdateModel sound model =
    ( { model
        | sounds = (updateStart sound.idName model.sounds)
        , editSound = sound
      }
    , playSound sound
    )


stopUpdateModel : Sound -> Model -> ( Model, Cmd Msg )
stopUpdateModel sound model =
    ( { model | sounds = (updateStop sound.idName model.sounds) }, stopSound sound )
