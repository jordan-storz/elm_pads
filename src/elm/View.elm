module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Model exposing (Model, Sound, Pad)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div [ id "application" ]
        [ editSoundControls model.focusPad
        , padControls model.pads
        ]


padControls : List Pad -> Html Msg
padControls pads =
    div [ id "pad-controls" ]
        (padGroup pads)


padGroup : List Pad -> List (Html Msg)
padGroup =
    List.map padView


padView : Pad -> Html Msg
padView pad =
    div [ class "pad-container" ]
        [ padButton pad, stopButton pad ]


stopButton : Pad -> Html Msg
stopButton pad =
    button
        [ onClick (StopSound pad)
        , classList
            [ ( "stop-button", True )
            , ( "disabled", not pad.playing )
            ]
        , disabled (not pad.playing)
        ]
        []


padButton : Pad -> Html Msg
padButton pad =
    button
        [ onClick (PlaySound pad)
        , classList
            [ ( "pad"
              , True
              )
            , ( "playing", pad.playing )
            ]
        , id <| "pad-" ++ (toString pad.id)
        ]
        [ soundAudio pad
        ]


soundAudio : Pad -> Html Msg
soundAudio pad =
    audio
        [ loop False
        , src pad.selectedSound.url
        , id <| (toString pad.id) ++ "-sound-audio"
        ]
        []


editSoundControls : Pad -> Html Msg
editSoundControls pad =
    div [ id "edit-sound-controls" ]
        [ text (toString pad.id) ]
