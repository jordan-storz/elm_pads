module PadSelect exposing (..)

import Model exposing (Pad)
import Maybe exposing (..)


padByKeyCode : Int -> List Pad -> Maybe Pad
padByKeyCode keyCode pads =
    case pads of
        pad :: xs ->
            if keyCode == pad.startKeyCode then
                Just pad
            else if keyCode == pad.stopKeyCode then
                Just pad
            else
                padByKeyCode keyCode xs

        [] ->
            Nothing
