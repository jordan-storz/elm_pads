module PadUpdate exposing (..)

import Model exposing (Pad)


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
