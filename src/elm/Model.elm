module Model exposing (..)

import Array exposing (Array)


type alias Model =
    { pads : List Pad
    , focusPad : Pad
    , soundBanks : Array SoundBank
    }


type alias Pad =
    { soundIndex : Int
    , soundBankIndex : Int
    , id : Int
    , startKeyCode : Int
    , stopKeyCode : Int
    , playing : Bool
    }


type alias Sound =
    { url : String
    , name : String
    }


type ControlType
    = Play
    | Stop


type alias SoundBank =
    Array Sound


initialModel : Model
initialModel =
    { pads = emptyPads
    , focusPad = firstPad emptyPads
    , soundBanks = Array.fromList [ blankSoundBank ]
    }


emptyPads : List Pad
emptyPads =
    [ { id = 1
      , soundIndex = 0
      , soundBankIndex = 0
      , startKeyCode = 71
      , stopKeyCode = 67
      , playing = False
      }
    , { id = 2
      , soundIndex = 0
      , soundBankIndex = 0
      , startKeyCode = 76
      , stopKeyCode = 191
      , playing = False
      }
    , { id = 3
      , soundIndex = 0
      , soundBankIndex = 0
      , startKeyCode = 66
      , stopKeyCode = 77
      , playing = False
      }
    , { id = 4
      , soundIndex = 0
      , soundBankIndex = 0
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
    , soundIndex = 0
    , soundBankIndex = 0
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


blankSoundBank : SoundBank
blankSoundBank =
    Array.fromList [ blankSound ]
