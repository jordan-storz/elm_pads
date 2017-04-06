module SoundSelect exposing (..)

import Model exposing (Sound)
import Maybe exposing (..)


soundByKeyCode : Int -> List Sound -> Maybe Sound
soundByKeyCode keyCode sounds =
    case sounds of
        sound :: xs ->
            if keyCode == sound.keyCode then
                Just sound
            else if keyCode == sound.stopCode then
                Just sound
            else
                soundByKeyCode keyCode xs

        [] ->
            Nothing
