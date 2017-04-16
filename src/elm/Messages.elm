module Messages exposing (..)

import Http
import Model exposing (Sound, Pad, SoundBank)


type Msg
    = PlaySound Pad
    | KeyPlaySound Int
    | StopSound Pad
    | KeyStopSound Int
    | StoppedSound Int
    | LoadSoundBank SoundBank Pad
    | FetchSoundBank String
    | FetchDefaultSoundBank
    | ReceiveSoundBank (Result Http.Error SoundBank)
    | NextSoundBank Pad
    | PrevSoundBank Pad
    | NoOp
