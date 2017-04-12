module Model exposing (..)

import Array exposing (Array)


type alias Model =
    { pads : List Pad
    , focusPad : Pad
    }


type alias Pad =
    { selectedSound : Sound
    , soundBank : Array Sound
    , id : Int
    , startKeyCode : Int
    , stopKeyCode : Int
    , playing : Bool
    }


type alias Sound =
    { url : String
    , idName : String
    }


type ControlType
    = Play
    | Stop


initialModel : Model
initialModel =
    { pads = emptyPads
    , focusPad = firstPad emptyPads
    }


emptyPads : List Pad
emptyPads =
    [ { id = 1
      , selectedSound = blankSound
      , soundBank = Array.fromList [ blankSound ]
      , startKeyCode = 71
      , stopKeyCode = 67
      , playing = False
      }
    , { id = 2
      , selectedSound = blankSound
      , soundBank = Array.fromList [ blankSound ]
      , startKeyCode = 76
      , stopKeyCode = 191
      , playing = False
      }
    , { id = 3
      , selectedSound = blankSound
      , soundBank = Array.fromList [ blankSound ]
      , startKeyCode = 66
      , stopKeyCode = 77
      , playing = False
      }
    , { id = 4
      , selectedSound = blankSound
      , soundBank = Array.fromList [ blankSound ]
      , startKeyCode = 86
      , stopKeyCode = 90
      , playing = False
      }
    ]


blankSound : Sound
blankSound =
    Sound "https://earbyter-1.s3.amazonaws.com/bells.m4a" "Chimes"


blankPad : Pad
blankPad =
    { id = 4
    , selectedSound = blankSound
    , soundBank = Array.fromList [ blankSound ]
    , startKeyCode = 86
    , stopKeyCode = 90
    , playing = False
    }


firstPad : List Pad -> Pad
firstPad pads =
    case List.head pads of
        Just pad ->
            pad

        Nothing ->
            blankPad
