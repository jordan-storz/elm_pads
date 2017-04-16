module PadUpdate exposing (..)

import Array exposing (Array)
import Model exposing (Pad, SoundBank, Sound)


type DirectionControl
    = Next
    | Previous


updateStop : Int -> List Pad -> List Pad
updateStop id =
    mapPlaying False id


updateStart : Int -> List Pad -> List Pad
updateStart id =
    mapPlaying True id


mapPlaying : Bool -> Int -> List Pad -> List Pad
mapPlaying playing id =
    List.map
        (\pad ->
            if pad.id == id then
                { pad | playing = playing }
            else
                pad
        )


updateSoundBank : DirectionControl -> Int -> Array SoundBank -> List Pad -> List Pad
updateSoundBank direction id soundBanks =
    let
        modifier =
            case direction of
                Next ->
                    1

                Previous ->
                    (-1)
    in
        List.map
            (\pad ->
                let
                    soundBanksLength =
                        Array.length soundBanks
                in
                    if pad.id == id then
                        { pad
                            | soundBankIndex = ((pad.soundBankIndex + modifier) % soundBanksLength)
                            , soundIndex = 0
                        }
                    else
                        pad
            )


nextSoundBank : Int -> Array SoundBank -> List Pad -> List Pad
nextSoundBank padId soundBanks pads =
    updateSoundBank Next padId soundBanks pads


previousSoundBank : Int -> Array SoundBank -> List Pad -> List Pad
previousSoundBank padId soundBanks pads =
    updateSoundBank Previous padId soundBanks pads


firstSound : SoundBank -> Sound
firstSound soundBank =
    case Array.get 1 soundBank of
        Just sound ->
            sound

        Nothing ->
            Sound "" ""
