module PadUpdate exposing (..)

import Array exposing (Array)
import Model exposing (Pad, SoundBank, Sound)


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


updateSoundBank : Int -> Array SoundBank -> List Pad -> List Pad
updateSoundBank id soundBanks =
    List.map
        (\pad ->
            let
                soundBanksLength =
                    Array.length soundBanks
            in
                if pad.id == id then
                    { pad
                        | soundBankIndex = ((pad.soundBankIndex + 1) % soundBanksLength)
                        , soundIndex = 0
                    }
                else
                    pad
        )


firstSound : SoundBank -> Sound
firstSound soundBank =
    case Array.get 1 soundBank of
        Just sound ->
            sound

        Nothing ->
            Sound "" ""
