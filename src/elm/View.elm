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
    List.map padButton


padButton : Sound -> Html Msg
padButton sound =
    button [ onClick (PlaySound sound), class "pad" ]
        [ soundAudio sound ]


soundAudio : Sound -> Html Msg
soundAudio sound =
    audio
        [ loop False
        , src sound.url
        , id sound.name
        ]
        []
