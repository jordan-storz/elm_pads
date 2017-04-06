module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Model exposing (Model, Sound)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div [ id "application" ]
        [ editSoundControls model.editSound
        , padControls model.sounds
        ]


padControls : List Sound -> Html Msg
padControls sounds =
    div [ id "pad-controls" ]
        (pads sounds)


pads : List Sound -> List (Html Msg)
pads =
    List.map pad


pad : Sound -> Html Msg
pad sound =
    div [ class "pad-container" ]
        [ padButton sound, stopButton sound ]


stopButton : Sound -> Html Msg
stopButton sound =
    button
        [ onClick (StopSound sound)
        , classList
            [ ( "stop-button", True )
            , ( "disabled", not sound.playing )
            ]
        , disabled (not sound.playing)
        ]
        []


padButton : Sound -> Html Msg
padButton sound =
    button
        [ onClick (PlaySound sound)
        , classList
            [ ( "pad"
              , True
              )
            , ( "playing", sound.playing )
            ]
        , id sound.idName
        ]
        [ soundAudio sound
        ]


soundAudio : Sound -> Html Msg
soundAudio sound =
    audio
        [ loop False
        , src sound.url
        ]
        []


editSoundControls : Sound -> Html Msg
editSoundControls sound =
    div [ id "edit-sound-controls" ]
        [ text (toString sound.url) ]
