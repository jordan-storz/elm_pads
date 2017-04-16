module Update exposing (..)

import Array exposing (Array)
import Messages exposing (..)
import Model exposing (Model, Sound, ControlType, Pad)
import Port exposing (playSound, stopSound)
import PadUpdate exposing (updateStart, updateStop, nextSoundBank, previousSoundBank)
import PadSelect exposing (padByKeyCode)
import Fetch


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlaySound pad ->
            Debug.log (toString model)
                playUpdateModel
                pad
                model

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

        LoadSoundBank soundBank pad ->
            playUpdateModel pad model

        StoppedSound id ->
            { model | pads = (updateStop id model.pads) } ! []

        FetchDefaultSoundBank ->
            ( model, Fetch.fetchDefaultSoundBank )

        FetchSoundBank username ->
            ( model, Fetch.fetchSoundBank username )

        ReceiveSoundBank (Ok soundBank) ->
            { model | soundBanks = Array.push soundBank model.soundBanks } ! []

        ReceiveSoundBank (Err _) ->
            ( model, Cmd.none )

        NextSoundBank pad ->
            ({ model
                | pads = nextSoundBank pad.id model.soundBanks model.pads
             }
            )
                ! []

        PrevSoundBank pad ->
            { model
                | pads = previousSoundBank pad.id model.soundBanks model.pads
            }
                ! []

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
