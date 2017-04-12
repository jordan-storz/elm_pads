module Update exposing (..)

import Messages exposing (..)
import Model exposing (Model, Sound, ControlType, Pad)
import Port exposing (playSound, stopSound)
import PadUpdate exposing (updateStart, updateStop)
import PadSelect exposing (padByKeyCode)
import Fetch


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaySound pad ->
            playUpdateModel pad model

        KeyPlaySound keyCode ->
            case padByKeyCode keyCode model.pads of
                Just pad ->
                    playUpdateModel pad model

                Nothing ->
                    ( model, Cmd.none )

        KeyStopSound keyCode ->
            case padByKeyCode keyCode model.pads of
                Just pad ->
                    stopUpdateModel pad model

                Nothing ->
                    ( model, Cmd.none )

        StopSound pad ->
            ( model, stopSound pad )

        StoppedSound id ->
            { model | pads = (updateStop id model.pads) } ! []

        FetchDefaultSoundBank ->
            ( model, Fetch.fetchDefaultSoundBank )

        FetchSoundBank username ->
            ( model, Fetch.fetchSoundBank username )

        ReceiveSoundBank (Ok soundBank) ->
            { model | soundBanks = soundBank :: model.soundBanks } ! []

        ReceiveSoundBank (Err _) ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


playUpdateModel : Pad -> Model -> ( Model, Cmd Msg )
playUpdateModel pad model =
    ( { model
        | pads = (PadUpdate.updateStart pad.id model.pads)
        , focusPad = pad
      }
    , playSound pad
    )


stopUpdateModel : Pad -> Model -> ( Model, Cmd Msg )
stopUpdateModel pad model =
    ( { model | pads = (PadUpdate.updateStop pad.id model.pads) }, stopSound pad )
