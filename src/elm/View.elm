module View exposing (..)

import Array exposing (Array)
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Model exposing (Model, Sound, Pad, SoundBank)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div [ id "application" ]
        [ settingsArea model
        , padControls model
        , soundBanksList model.soundBanks
        ]


padControls : Model -> Html Msg
padControls model =
    div [ id "pad-controls" ]
        (padGroup model model.pads)


padGroup : Model -> List Pad -> List (Html Msg)
padGroup model =
    List.map (padView model)


padView : Model -> Pad -> Html Msg
padView model pad =
    div [ class "pad-container" ]
        [ padButton model pad, stopButton pad ]


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


padButton : Model -> Pad -> Html Msg
padButton model pad =
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
        [ soundAudio model pad
        ]


soundAudio : Model -> Pad -> Html Msg
soundAudio model pad =
    audio
        [ loop False
        , src (getPadSrc pad model)
        , id <| (toString pad.id) ++ "-sound-audio"
        ]
        []


settingsArea : Model -> Html Msg
settingsArea model =
    div [ id "settings-area" ]
        (List.map
            (padSettings model)
            model.pads
        )


padSettings : Model -> Pad -> Html Msg
padSettings model pad =
    div [ class "pad-settings" ]
        [ (soundBankSelect model.soundBanks pad)
        , (soundSelect pad (accessSoundBank pad model))
        ]


soundSelect : Pad -> SoundBank -> Html Msg
soundSelect pad soundBank =
    div
        [ classList
            [ ( "sound-select", True )
            , ( "selector-container", True )
            ]
        ]
        [ button [ onClick (PreviousSound pad) ] [ text "-" ]
        , div [ class "sound-name" ] [ text "Sound:", p [] [ text (.name <| getSound pad soundBank) ] ]
        , button [ onClick (NextSound pad) ] [ text "+" ]
        ]


getSound : Pad -> SoundBank -> Sound
getSound pad soundBank =
    case Array.get pad.soundIndex soundBank of
        Just sound ->
            sound

        Nothing ->
            Model.blankSound


soundBankSelect : Array SoundBank -> Pad -> Html Msg
soundBankSelect soundBanks pad =
    div
        [ classList
            [ ( "sound-bank-select", True )
            , ( "selector-container", True )
            ]
        ]
        [ button [ onClick (PrevSoundBank pad) ] [ text "-" ]
        , text "Soundbank"
        , button [ onClick (NextSoundBank pad) ] [ text "+" ]
        ]


soundBanksList : Array SoundBank -> Html Msg
soundBanksList soundBanks =
    div [] <|
        Array.toList <|
            Array.map
                (\soundBank -> soundsList soundBank)
                soundBanks


soundsList : SoundBank -> Html Msg
soundsList soundBank =
    ul [] <|
        Array.toList <|
            Array.map
                (\sound -> soundView sound)
                soundBank


soundView : Sound -> Html Msg
soundView sound =
    li [] [ text sound.name ]


getPadSrc : Pad -> Model -> String
getPadSrc pad model =
    accessSrc pad <| accessSoundBank pad model


accessSoundBank : Pad -> Model -> SoundBank
accessSoundBank pad model =
    case Array.get pad.soundBankIndex model.soundBanks of
        Just soundBank ->
            soundBank

        Nothing ->
            Model.blankSoundBank


accessSrc : Pad -> SoundBank -> String
accessSrc pad soundBank =
    case Array.get pad.soundIndex soundBank of
        Just sound ->
            sound.url

        Nothing ->
            ""
