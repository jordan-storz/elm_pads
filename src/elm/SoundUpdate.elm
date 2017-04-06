module SoundUpdate exposing (..)

import Model exposing (Sound)


updateStop : String -> List Sound -> List Sound
updateStop idName =
    mapPlaying False idName


updateStart : String -> List Sound -> List Sound
updateStart idName =
    mapPlaying True idName


mapPlaying : Bool -> String -> List Sound -> List Sound
mapPlaying playing idName =
    List.map
        (\sound ->
            if sound.idName == idName then
                { sound | playing = playing }
            else
                sound
        )
