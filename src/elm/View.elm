module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Model exposing (Model, Sound)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div [ id "pad-controls" ]
        (pads model.sounds)


pads : List Sound -> List (Html Msg)
pads =
    List.map pad


pad : Sound -> Html Msg
pad sound =
    div [ class "pad-container" ]
        [ padButton sound, stopButton sound ]


stopButton : Sound -> Html Msg
stopButton sound =
    button [ onClick (StopSound sound) ] []


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
