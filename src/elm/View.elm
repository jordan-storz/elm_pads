module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (PlaySound model.sound) ] []
        , soundAudio model
        ]


soundAudio : Model -> Html Msg
soundAudio { sound } =
    audio
        [ loop False
        , src sound.url
        ]
        []
